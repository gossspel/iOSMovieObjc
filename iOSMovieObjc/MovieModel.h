//
//  MovieModel.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/10/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property (nullable, nonatomic, strong) NSString *title;
@property (nullable, nonatomic, strong) NSString *overview;
@property (nullable, nonatomic, strong) NSString *posterPath;
@property (nullable, nonatomic, strong) NSString *releaseDate;

- (instancetype _Nonnull)initWith:(NSDictionary * _Nonnull)initDict;

@end
