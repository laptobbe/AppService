//
//  TSCoreDataSaveOperation.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-27.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCoreData.h"
#import "TSOperation.h"

@interface TSCoreDataSaveOperation : NSOperation <TSOperation>

@property (nonatomic, strong) NSString *modelName;
@property (nonatomic, assign) TSCoreDataAccessBlock block;

- (id)initWithModelName:(NSString *)modelName updateBlock:(TSCoreDataAccessBlock)block;

@end
