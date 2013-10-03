//
//  TSDataBaseHelper.h
//  TSDataBaseHelper
//
//  Created by Tobias Sundstrand on 2013-05-07.
//  Copyright (c) 2013 Computertalk Sweden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSManagedObjectContext+Convenience.h"

typedef void (^TSCoreDataFetchBlock)(NSManagedObjectContext *context, NSArray *objects, NSError *error);
typedef void (^TSCoreDataAccessBlock)(NSManagedObjectContext *context);

@interface TSCoreData : NSObject

+ (id)sharedInstanceForModelName:(NSString *)modelName error:(NSError **)error;
- (id)initWithModelName:(NSString *)modelName error:(NSError **)error;

- (void)sendRequest:(NSFetchRequest *)fetchRequest withHandleBlock:(TSCoreDataFetchBlock) block;
- (void)accessAndSaveWithHandleBlock:(TSCoreDataAccessBlock)block saveError:(NSError **)saveError;
- (void)accessWithHandleBlock:(TSCoreDataAccessBlock)block;

- (NSManagedObjectContext *) newManagedObjectContext;

- (void)clear;

@end