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

- (void)sendHTTPGETRequestWithURLStr:(NSString *)URLStr
                             headers:(NSDictionary<NSString *,NSString *> *)headers
                   queryStringParams:(NSDictionary<NSString *,NSString *> *)queryStringParams
                   completionHandler:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    [self sendHTTPRequestWith_:URLStr HTTPVerb:@"GET" headers:headers params:queryStringParams completionHandler:completionHandler];
}

- (void)sendHTTPPOSTRequestWithURLStr:(NSString *)URLStr
                              headers:(NSDictionary<NSString *,NSString *> *)headers
                        URLFormParams:(NSDictionary<NSString *,NSString *> *)URLFormParams
                    completionHandler:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    [self sendHTTPRequestWith_:URLStr HTTPVerb:@"POST" headers:headers params:URLFormParams completionHandler:completionHandler];
}

- (void)sendHTTPRequestWith_:(NSString * _Nonnull)URLStr
                    HTTPVerb:(NSString * _Nonnull)HTTPVerb
                     headers:(NSDictionary<NSString *, NSString *> * _Nullable)headers
                      params:(NSDictionary<NSString *, NSString *> * _Nullable)params
           completionHandler:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    if (headers) {
        for (NSString *key in headers) {
            NSString *value = [headers objectForKey:key];
            [serializer setValue:value forHTTPHeaderField:key];
        }
    }
    
    NSURLRequest *request = [serializer requestWithMethod:HTTPVerb URLString:URLStr parameters:params error:nil];

    if (request) {
        NSURLSessionDataTask *dataTask = [self.sessionManager dataTaskWithRequest:request completionHandler:completionHandler];
        [dataTask resume];
    }
}

@end
