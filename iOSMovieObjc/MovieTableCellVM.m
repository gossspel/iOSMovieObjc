//
//  MovieTableCellVM.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieTableCellVM.h"

@implementation MovieTableCellVM

NSString *const BASE_URL = @"https://image.tmdb.org/t/p/w185/%@";

- (instancetype)initWithMovie:(MovieModel *)movie {
    self = [super init];
    
    if (self) {
        self.titleLabelText = movie.title;
        self.overviewLabelText = movie.overview;
        self.imageURLStr = [NSString stringWithFormat:BASE_URL, movie.posterPath];
    }
    
    return self;
}

@end
