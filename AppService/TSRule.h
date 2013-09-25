//
//  TSRule.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"

typedef enum {
    TSRelationshipTypeSuccess,
    TSRelationshipTypeFailiure,
    TSRelationshipTypeComplete,
} TSRelationshipType;

@interface TSRule : NSObject

@property (nonatomic, strong) NSOperation<TSOperation> *when;
@property (nonatomic, strong) NSOperation<TSOperation> *then;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (assign) TSRelationshipType relationship;

+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isSuccessThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue;
+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isFailiureThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue;
+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isFinishedThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue;

- (void)enforce;

@end
