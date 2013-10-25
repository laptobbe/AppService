//
//  TSSchema.m
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSFlow.h"
#import "TSRule.h"

@implementation TSFlow

- (id)initWithRules:(NSArray *)rules {
    self = [super init];
    if (self) {
        self.rules = rules;
    }
    return self;
}

- (TSFlow *)startExecutingOnQueue:(NSOperationQueue *)startQueue {
    [startQueue addOperation:[self.rules.firstObject when]];
    return self;
}

+ (TSFlow *)flowWithRules:(NSArray *)rules {
    TSFlow *schema = [[TSFlow alloc] initWithRules:rules];
    [schema enforceRules];
    return schema;
}

+ (TSFlow *)startExecutingOnQueue:(NSOperationQueue *)startQueue withSchema:(NSArray *)rules {
    TSFlow *schema = [TSFlow flowWithRules:rules];
    [schema startExecutingOnQueue:startQueue];
    return schema;
}

- (void)enforceRules {
    for (TSRule *rule in self.rules) {
        [rule enforce];
    }
}

@end
