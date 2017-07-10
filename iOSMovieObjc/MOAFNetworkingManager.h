//
//  MOAFNetworkingManager.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/7/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOAPIClient.h"

@interface MOAFNetworkingManager : NSObject <MOAPIClientProtocol>

- (instancetype)init;

@end
