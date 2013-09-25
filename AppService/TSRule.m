//
//  TSRule.m
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSRule.h"

NSString *const IS_FINISHED = @"isFinished";
NSString *const IS_SUCCESS = @"isSuccess";
NSString *const IS_FAILIURE = @"isFailiure";

@implementation TSRule

- (id)initWithQueue:(NSOperationQueue *)operationQueue when:(NSOperation<TSOperation> *)when then:(NSOperation<TSOperation> *)then relationship:(TSRelationshipType)relationship {
    self = [super init];
    if (self) {
        self.operationQueue = operationQueue;
        self.when = when;
        self.then = then;
        self.relationship = relationship;
    }
    return self;
}

+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isSuccessThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue {
    return [[TSRule alloc] initWithQueue:operationQueue when:when then:then relationship:TSRelationshipTypeSuccess];
}

+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isFailiureThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue {
    return [[TSRule alloc] initWithQueue:operationQueue when:when then:then relationship:TSRelationshipTypeFailiure];
}

+ (TSRule *)ruleWithWhen:(NSOperation<TSOperation> *)when isFinishedThenExecute:(NSOperation<TSOperation> *)then onQueue:(NSOperationQueue *)operationQueue {
    return [[TSRule alloc] initWithQueue:operationQueue when:when then:then relationship:TSRelationshipTypeComplete];
}

- (void)enforce {
    switch (self.relationship) {
        case TSRelationshipTypeComplete:
            [self addObserver:self.when
                   forKeyPath:IS_FINISHED
                      options:NSKeyValueObservingOptionNew
                      context:NULL];
            break;
        case TSRelationshipTypeSuccess:
            [self addObserver:self.when
                   forKeyPath:IS_SUCCESS
                      options:NSKeyValueObservingOptionNew
                      context:NULL];
            break;
            
        case TSRelationshipTypeFailiure:
            [self addObserver:self.when
                   forKeyPath:IS_FAILIURE
                      options:NSKeyValueObservingOptionNew
                      context:NULL];
            break;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:IS_FINISHED] || [keyPath isEqualToString:IS_SUCCESS]) {
        self.then.input = self.when.result;
        [[self operationQueue] addOperation:self.then];
    }else if([keyPath isEqualToString:IS_FAILIURE]) {
        self.then.error = self.when.error;
        [[self operationQueue] addOperation:self.then];
    }
}

@end
