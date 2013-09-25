//
//  TSErrorOperation.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSErrorOperation.h"

@implementation TSErrorOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;


- (id)initWithBlock:(void (^)(NSError *error)) block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

+ (TSErrorOperation *)operationWithBlock:(void (^)(NSError *error))block {
    return [[TSErrorOperation alloc] initWithBlock:block];
}

- (void)main {
    self.block(self.error);
}

@end
