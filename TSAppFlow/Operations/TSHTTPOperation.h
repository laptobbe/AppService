//
//  TSNetworkOperation.h
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOperation.h"
#import <AFNetworking/AFHTTPRequestOperation.h>

@interface TSHTTPOperation : AFHTTPRequestOperation <TSOperation>

@end
