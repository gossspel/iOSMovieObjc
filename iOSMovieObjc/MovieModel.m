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
    
    if ([initDict objectForKey:@"poster_path"]) {
        self.posterPath = initDict[@"poster_path"];
    }
    
    if ([initDict objectForKey:@"release_date"]) {
        self.releaseDate = initDict[@"release_date"];
    }
    
    return self;
}

@end
