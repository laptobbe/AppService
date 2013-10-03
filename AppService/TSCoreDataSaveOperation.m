//
//  TSCoreDataSaveOperation.m
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-27.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSCoreDataSaveOperation.h"


@implementation TSCoreDataSaveOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;

- (id)initWithModelName:(NSString *)modelName updateBlock:(TSCoreDataAccessBlock)block {
    self = [super init];
    if (self) {
        self.modelName = modelName;
        self.block = block;
    }
    return self;
}

- (void)main {
    NSError *creationError = nil;
    TSCoreData *coreData = [TSCoreData sharedInstanceForModelName:self.modelName error:&creationError];
    if (creationError) {
        self.error = creationError;
        self.failiure = YES;
        return;
    }
    
    NSError *saveError = nil;
    [coreData accessAndSaveWithHandleBlock:self.block saveError:&saveError];
    if (saveError) {
        self.error = saveError;
        self.failiure = YES;
        return;
    }
    
    self.success = YES;
}

@end
