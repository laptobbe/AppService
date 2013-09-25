//
//  TSQueueController.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSQueueController.h"

@implementation TSQueueController

+ (TSQueueController *)sharedQueueController {
    
    static TSQueueController *sharedQueueController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedQueueController = [[TSQueueController alloc] init];
    });
    
    return sharedQueueController;
}

+ (NSOperationQueue *)serialQueue {
    return [[TSQueueController sharedQueueController] serialQueue];
}

+ (NSOperationQueue *)concurrentQueue {
    return [[TSQueueController sharedQueueController] concurrentQueue];
}

- (id)init
{
    self = [super init];
    if (self) {
        _serialQueue = [[NSOperationQueue alloc] init];
        _serialQueue.maxConcurrentOperationCount = 1;
        
        _concurrentQueue = [[NSOperationQueue alloc] init];
        _concurrentQueue.maxConcurrentOperationCount = 20;
    }
    return self;
}

@end
