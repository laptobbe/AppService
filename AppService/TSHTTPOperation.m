//
//  TSNetworkOperation.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "TSHTTPOperation.h"
#import "NSHTTPURLResponse+TSAdditions.h"

NSString *const TSHTTPErrorDomain = @"TSHTTPErrorDomain";
NSString *const TSHTTPResponseKey = @"TSHTTPResponseKey";

@implementation TSHTTPOperation

@synthesize success;
@synthesize failiure;
@synthesize result;
@synthesize input;
@synthesize error;

-(void)main {
    @autoreleasepool {
        self.connection = [NSURLConnection connectionWithRequest:self.input delegate:self];
        
        while (![self isCancelled] && ![self isDone]) {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
        }
        
        if ([self isCancelled]) {
            [self cancelConnection];
        }else if ([self isDone]) {
            [self checkConnectionResults];
        }
    }
}

- (void)cancelConnection {
    [self.connection cancel];
    self.error = [NSError errorWithDomain:TSHTTPErrorDomain code:kTSOperationCancelled userInfo:nil];
    self.failiure = YES;
}

- (void)checkConnectionResults {
    if (self.error) {
        self.failiure = YES;
        return;
    }
    
    if (![self.response isSuccessResponse]) {
        self.error = [NSError errorWithDomain:TSHTTPErrorDomain code:kTSUnexpectedStatusCode userInfo:@{TSHTTPResponseKey: self.response}];
        self.failiure = YES;
        return;
    }
    
    self.result = self.data;
    self.success = YES;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)connectionError {
    self.error = connectionError;
    self.done = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)connectionResponse {
    self.response = (NSHTTPURLResponse *)connectionResponse;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)connectionData {
    if (self.data) {
        [self.data appendData:connectionData];
    }else {
        self.data = [connectionData mutableCopy];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.done = YES;
}
@end
