//
//  TSCoreDataOperation.h
//  TSAppFlow
//
//  Created by Tobias Sundstrand on 2013-09-27.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TSOperation.h"

@interface TSCoreDataFetchOperation : NSOperation <TSOperation>

@property (nonatomic, strong)NSString *modelName;
@property (nonatomic, strong)NSFetchRequest *fetchRequest;

- (id)initWithModelName:(NSString *)modelName fetchRequest:(NSFetchRequest *)fetchRequest;

@end
