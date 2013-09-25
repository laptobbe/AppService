//
//  TSSchema.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSSchema : NSObject

@property (nonatomic, strong) NSArray *rules;

+ (TSSchema *)schema:(NSArray *)rules;
+ (TSSchema *)startExecutingOnQueue:(NSOperationQueue *)startQueue withSchema:(NSArray *)rules;
- (TSSchema *)startExecutingOnQueue:(NSOperationQueue *)startQueue;

@end
