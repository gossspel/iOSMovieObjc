//
//  MOAPIClient.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/9/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOAPIClientProtocol <NSObject>

- (void)sendHTTPGETRequestWithURLStr:(NSString * _Nonnull)URLStr
                             headers:(NSDictionary<NSString *, NSString *> * _Nullable)headers
                   queryStringParams:(NSDictionary<NSString *, NSString *> * _Nullable)queryStringParams
                   completionHandler:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler;

- (void)sendHTTPPOSTRequestWithURLStr:(NSString * _Nonnull)URLStr
                              headers:(NSDictionary<NSString *, NSString *> * _Nullable)headers
                        URLFormParams:(NSDictionary<NSString *, NSString *> * _Nullable)URLFormParams
                    completionHandler:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler;

@end

@interface MOAPIClient : NSObject <MOAPIClientProtocol>

- (instancetype _Nonnull)init;

@end
