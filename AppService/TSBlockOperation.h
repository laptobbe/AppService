//
//  TSBlockOperation.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"

typedef id (^TSOperationBlock)(NSError **);

@interface TSBlockOperation : NSOperation <TSOperation>

@property (nonatomic, strong) TSOperationBlock block;

+ (TSBlockOperation *)operationWithBlock:(TSOperationBlock)block;
- (id)initWithBlock:(TSOperationBlock)block;

@end
