//
//  MovieListVM.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieListVM.h"
#import "MovieTableCellVM.h"

@interface MovieListVM ()

@property (nonatomic, strong) MovieDataService *service;

@end

@implementation MovieListVM

- (instancetype)initWithServiceType:(MovieDataServiceType)serviceType {
    self = [super init];
    
    if (self) {
        self.cellReuseID = @"MovieTableCell";
        self.movieTableCellVMs = [[NSMutableArray alloc] init];
        self.service = [[MovieDataService alloc] initWith:serviceType];
        [self getMovies];
    }
    
    return self;
}

- (void)getMovies {
    __weak MovieListVM *weakSelf = self;
    [self.service getListWithPage:1 successHandler:^(NSArray *movies) {
        for (MovieModel *movie in movies) {
            MovieTableCellVM *cellVM = [[MovieTableCellVM alloc] initWithMovie:movie];
            [weakSelf.movieTableCellVMs addObject:cellVM];
        }
        
        weakSelf.movieTableCellVMsUpdated = YES;
    }];
}

@end
