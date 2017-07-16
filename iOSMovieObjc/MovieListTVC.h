//
//  MovieListTVC.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDataService.h"

@interface MovieListTVC : UITableViewController

- (instancetype)initWithServiceType:(MovieDataServiceType)serviceType;

@end
