//
//  TSQueueController.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSQueueController : NSObject

@property (readonly) NSOperationQueue *serialQueue;
@property (readonly) NSOperationQueue *concurrentQueue;

+ (TSQueueController *)sharedQueueController;
+ (NSOperationQueue *)serialQueue;
+ (NSOperationQueue *)concurrentQueue;

@end
