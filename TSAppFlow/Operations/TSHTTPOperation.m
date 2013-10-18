//
//  TSNetworkOperation.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSHTTPOperation.h"
#import "NSHTTPURLResponse+TSAdditions.h"
#import "TSQueueController.h"
#import <libextobjc/EXTScope.h>

@implementation TSHTTPOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;

- (id)initWithRequest:(NSURLRequest *)urlRequest {
    NSParameterAssert(urlRequest);
    self = [super initWithRequest:urlRequest];
    if (self) {
        @weakify(self);
        [self setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            @strongify(self);
            self.result = responseObject;
            self.success = YES;
        } failure:^(AFHTTPRequestOperation *operation, NSError *networkError) {
            @strongify(self);
            self.error = networkError;
            self.failiure = YES;
        }];
    }
    return self;
}

@end
