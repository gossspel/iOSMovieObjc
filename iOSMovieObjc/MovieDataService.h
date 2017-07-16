//
//  MovieDataService.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/11/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MovieDataServiceType) {
    now_playing,
    popular,
    top_rated,
    upcoming
};

@interface MovieDataService : NSObject

- (instancetype _Nonnull)initWith:(MovieDataServiceType)serviceType;
- (void)getListWithPage:(NSInteger)page successHandler:(void (^ _Nullable)(NSArray * _Nonnull))successHandler; // NSArray<MovieModel *>*

@end
