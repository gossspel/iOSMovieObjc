//
//  MOAFNetworkingManager.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/7/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MOAFNetworkingManager.h"
#import "AFURLSessionManager.h"

@interface MOAFNetworkingManager ()

@property (nonatomic, strong) AFURLSessionManager *manager;

@end

@implementation MOAFNetworkingManager

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    
    return self;
}

@end
