//
//  MovieModel.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/10/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

- (instancetype)initWith:(NSDictionary *)initDict {
    self = [super init];
    if ([initDict objectForKey:@"title"]) {
        self.title = initDict[@"title"];
    }
    
    if ([initDict objectForKey:@"overview"]) {
        self.overview = initDict[@"overview"];
    }
    
    if ([initDict objectForKey:@"posterPath"]) {
        self.posterPath = initDict[@"posterPath"];
    }
    
    if ([initDict objectForKey:@"releaseDate"]) {
        self.releaseDate = initDict[@"releaseDate"];
    }
    
    return self;
}

@end
