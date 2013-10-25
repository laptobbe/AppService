//
//  TSOperation.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-14.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSOperation <NSObject>

@property (nonatomic, assign, getter = isSuccess) BOOL success;
@property (nonatomic, assign, getter = isFailiure) BOOL failiure;
@property (nonatomic, strong) id result;
@property (nonatomic, strong) id input;
@property (nonatomic, strong) NSError *error;

@end
