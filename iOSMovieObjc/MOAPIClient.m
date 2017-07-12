//
//  MOAPIClient.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/9/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MOAPIClient.h"
#import "MOAFNetworkingManager.h"

@interface MOAPIClient ()

@property (nonatomic, strong, nonnull) NSObject <MOAPIClientProtocol> *networkingManager;
@property (nonatomic, strong, nonnull) NSString *apiKey;

@end

@implementation MOAPIClient

- (instancetype _Nonnull)init {
    self = [super init];
    
    // Note: we can swap manager here in the future.
    self.networkingManager = [[MOAFNetworkingManager alloc] init];
    self.apiKey = @"a07e22bc18f5cb106bfe4cc1f83ad8ed";
    
    return self;
}

- (void)sendHTTPGETRequestWithURLStr:(NSString *)URLStr
                             headers:(NSDictionary<NSString *,NSString *> *)headers
                   queryStringParams:(NSDictionary<NSString *,NSString *> *)queryStringParams
                   completionHandler:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    NSMutableDictionary<NSString *, NSString *> *params = [[NSMutableDictionary alloc] initWithDictionary:queryStringParams];
    params[@"api_key"] = self.apiKey;
    [self.networkingManager sendHTTPGETRequestWithURLStr:URLStr headers:headers queryStringParams:params completionHandler:completionHandler];
}

- (void)sendHTTPPOSTRequestWithURLStr:(NSString *)URLStr
                              headers:(NSDictionary<NSString *,NSString *> *)headers
                        URLFormParams:(NSDictionary<NSString *,NSString *> *)URLFormParams
                    completionHandler:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    // TODO: add apiKey
    [self.networkingManager sendHTTPPOSTRequestWithURLStr:URLStr headers:headers URLFormParams:URLFormParams completionHandler:completionHandler];
}

@end
