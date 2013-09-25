//
//  TSErrorOperation.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-25.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"

typedef void (^TSErrorBlock)(NSError *);

@interface TSErrorOperation : NSOperation <TSOperation>

@property (nonatomic, copy) TSErrorBlock block;

+ (TSErrorOperation *)operationWithBlock:(void (^)(NSError *error))block;
@end
