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

@end

@implementation MOAPIClient

- (instancetype _Nonnull)init {
    self = [super init];
    
    // Note: we can swap manager here in the future.
    self.networkingManager = [[MOAFNetworkingManager alloc] init];
    
    return self;
}

- (void)sendHTTPGETRequest:(NSString *)URLStr b:(NSDictionary *)queryStringParameters c:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler {
    [self.networkingManager sendHTTPGETRequest:URLStr b:queryStringParameters c:completionHandler];
}

- (void)sendHTTPPOSTRequest:(NSString *)URLStr b:(NSDictionary *)URLFormParameters c:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler {
    [self.networkingManager sendHTTPPOSTRequest:URLStr b:URLFormParameters c:completionHandler];
}

@end
