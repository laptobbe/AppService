//
//  TSSchema.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSFlow : NSObject

@property (nonatomic, strong) NSArray *rules;

+ (TSFlow *)flowWithRules:(NSArray *)rules;
+ (TSFlow *)startExecutingOnQueue:(NSOperationQueue *)startQueue withSchema:(NSArray *)rules;
- (TSFlow *)startExecutingOnQueue:(NSOperationQueue *)startQueue;

@end
