//
//  MovieListTBC.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/16/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieListTBC.h"
#import "MovieListTVC.h"

@interface MovieListTBC ()

@end

@implementation MovieListTBC

- (instancetype)init {
    self = [super init];
    
    if (self) {
        MovieListTVC *tvc1 = [[MovieListTVC alloc] initWithServiceType:now_playing];
        MovieListTVC *tvc2 = [[MovieListTVC alloc] initWithServiceType:popular];
        MovieListTVC *tvc3 = [[MovieListTVC alloc] initWithServiceType:upcoming];
        MovieListTVC *tvc4 = [[MovieListTVC alloc] initWithServiceType:top_rated];
        UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:tvc1];
        UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:tvc2];
        UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:tvc3];
        UINavigationController *nc4 = [[UINavigationController alloc] initWithRootViewController:tvc4];
        nc1.topViewController.title = @"Now Playing";
        nc2.topViewController.title = @"Popular";
        nc3.topViewController.title = @"Upcoming";
        nc4.topViewController.title = @"Top Rated";
        self.viewControllers = @[nc1, nc2, nc3, nc4];
    }
    
    return self;
}

@end
