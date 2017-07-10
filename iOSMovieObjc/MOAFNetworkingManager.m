//
//  MOAFNetworkingManager.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/7/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MOAFNetworkingManager.h"
#import "AFNetworking.h"

@interface MOAFNetworkingManager ()

@property (nonatomic, strong) AFURLSessionManager *sessionManager;

@end

@implementation MOAFNetworkingManager

- (instancetype)init {
    self = [super init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    return self;
}

- (void)sendHTTPGETRequest:(NSString *)URLStr b:(NSDictionary *)queryStringParameters c:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler {
    [self sendHTTPRequest:URLStr b:@"GET" c:queryStringParameters d:completionHandler];
}

- (void)sendHTTPPOSTRequest:(NSString *)URLStr b:(NSDictionary *)URLFormParameters c:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler {
    [self sendHTTPRequest:URLStr b:@"POST" c:URLFormParameters d:completionHandler];
}

- (void)sendHTTPRequest:(NSString * _Nonnull)URLStr b:(NSString * _Nonnull)HTTPVerbStr c:(NSDictionary * _Nullable)params d:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler {
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    NSURLRequest *request = [serializer requestWithMethod:HTTPVerbStr URLString:URLStr parameters:params error:nil];

    if (request) {
        NSURLSessionDataTask *dataTask = [self.sessionManager dataTaskWithRequest:request completionHandler:completionHandler];
        [dataTask resume];
    }
}

@end
