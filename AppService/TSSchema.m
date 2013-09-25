//
//  TSSchema.m
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSSchema.h"
#import "TSRule.h"

@implementation TSSchema

- (id)initWithRules:(NSArray *)rules {
    self = [super init];
    if (self) {
        self.rules = rules;
    }
    return self;
}

- (TSSchema *)startExecutingOnQueue:(NSOperationQueue *)startQueue {
    [startQueue addOperation:[self.rules.firstObject when]];
    return self;
}

+ (TSSchema *)schema:(NSArray *)rules {
    TSSchema *schema = [[TSSchema alloc] initWithRules:rules];
    [schema enforceRules];
    return schema;
}

+ (TSSchema *)startExecutingOnQueue:(NSOperationQueue *)startQueue withSchema:(NSArray *)rules {
    TSSchema *schema = [TSSchema schema:rules];
    [schema startExecutingOnQueue:startQueue];
    return schema;
}

- (void)enforceRules {
    for (TSRule *rule in self.rules) {
        [rule enforce];
    }
}

@end
