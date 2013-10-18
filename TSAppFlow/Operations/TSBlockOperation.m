//
//  TSBlockOperation.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSBlockOperation.h"

@implementation TSBlockOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;

+ (TSBlockOperation *)operationWithBlock:(TSOperationBlock)block {
    return [[TSBlockOperation alloc] initWithBlock:block];
}

- (id)initWithBlock:(TSOperationBlock)block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

-(void)main {
    NSError *blockError = nil;
    self.result = self.block(self.input, &blockError);

    if (blockError) {
        self.error = blockError;
        self.failiure = YES;
        return;
    }
    
    self.success = YES;
}

@end
