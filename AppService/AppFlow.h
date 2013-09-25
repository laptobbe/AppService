//
//  AppFlow.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"
#import "TSSchema.h"

@interface AppFlow : NSObject

+ (TSSchema *)download:(NSOperation<TSOperation> *)networkOperation thenSave:(NSOperation<TSOperation> *)saveOperation andUpdateUI:(NSOperation<TSOperation> *)UIOperation errorOperation:(NSOperation<TSOperation> *) errorOperation;

@end
