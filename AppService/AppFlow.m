//
//  AppFlow.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "AppFlow.h"
#import "TSRule.h"
#import "TSQueueController.h"
#import "TSErrorOperation.h"

@implementation AppFlow

+ (TSSchema *)download:(NSOperation<TSOperation> *)networkOperation thenSave:(NSOperation<TSOperation> *)saveOperation andUpdateUI:(NSOperation<TSOperation> *)UIOperation errorOperation:(NSOperation<TSOperation> *) errorOperation{
    return [TSSchema startExecutingOnQueue:[TSQueueController concurrentQueue] withSchema:@[
        [TSRule ruleWithWhen:networkOperation isSuccessThenExecute:saveOperation onQueue:[TSQueueController concurrentQueue]],
        [TSRule ruleWithWhen:saveOperation isSuccessThenExecute:UIOperation onQueue:[NSOperationQueue mainQueue]],
        [TSRule ruleWithWhen:networkOperation isFailiureThenExecute:errorOperation onQueue:[NSOperationQueue mainQueue]],
        [TSRule ruleWithWhen:saveOperation isFailiureThenExecute:errorOperation onQueue:[NSOperationQueue mainQueue]]
    ]];
    
}

@end
