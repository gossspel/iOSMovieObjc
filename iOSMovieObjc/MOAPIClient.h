//
//  MOAPIClient.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/9/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOAPIClientProtocol <NSObject>

- (void) sendHTTPGETRequest:(NSString * _Nonnull)URLStr b:(NSDictionary * _Nullable)queryStringParameters c:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler;

- (void) sendHTTPPOSTRequest:(NSString * _Nonnull)URLStr b:(NSDictionary * _Nullable)URLFormParameters c:(void (^ _Nullable)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler;

@end

@interface MOAPIClient : NSObject <MOAPIClientProtocol>

- (instancetype _Nonnull)init;

@end
