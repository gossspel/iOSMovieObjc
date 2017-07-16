//
//  MovieTableCellVM.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieTableCellVM.h"

@implementation MovieTableCellVM


- (instancetype)initWithMovie:(MovieModel *)movie {
    self = [super init];
    
    if (self) {
        self.titleLabelText = movie.title;
        self.overviewLabelText = movie.overview;
        self.imageURLStr = movie.posterPath;
    }
    
    return self;
}

@end
