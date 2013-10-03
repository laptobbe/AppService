//
//  NSHTTPURLResponse+TSAdditions.m
//  AppService
//
//  Created by Tobias Sundstrand on 2013-09-26.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import "NSHTTPURLResponse+TSAdditions.h"

@implementation NSHTTPURLResponse (TSAdditions)

- (BOOL)isSuccessResponse {
    return self.statusCode >= 200 && self.statusCode <= 299;
}

@end
