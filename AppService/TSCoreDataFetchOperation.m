//
//  TSCoreDataOperation.m
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-27.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSCoreDataFetchOperation.h"
#import "TSCoreData.h"

@implementation TSCoreDataFetchOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;

- (id)initWithModelName:(NSString *)modelName fetchRequest:(NSFetchRequest *)fetchRequest{
    self = [super init];
    if (self) {
        self.modelName = modelName;
        self.fetchRequest = fetchRequest;
    }
    return self;
}

- (void)main {
    NSError *operationError = nil;
    TSCoreData *coreData = [TSCoreData sharedInstanceForModelName:self.modelName error:&operationError];
    if (operationError) {
        self.error = operationError;
        self.failiure = YES;
        return;
    }
    
    __block NSArray *fetchResult;
    __block NSError *fetchError;
    [coreData accessWithHandleBlock:^(NSManagedObjectContext *context) {
        fetchResult = [context executeFetchRequest:self.fetchRequest error:&fetchError];
    }];
    
    if (fetchError) {
        self.error = fetchError;
        self.failiure = YES;
        return;
    }
    
    self.result = fetchResult;
    self.success = YES;
}

@end
