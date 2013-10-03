//
//  TSNetworkOperation.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"

enum TSNetworkErrors {
    kTSOperationCancelled = 1,
    kTSUnexpectedStatusCode = 2,
};
typedef enum TSNetworkErrors TSNetworkErrors;

extern NSString *const TSHTTPErrorDomain;
extern NSString *const TSHTTPResponseKey;

@interface TSHTTPOperation : NSOperation <TSOperation>

@property (assign, getter = isDone) BOOL done;

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic, strong) NSMutableData *data;

@end
