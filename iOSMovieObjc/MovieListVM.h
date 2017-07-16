//
//  MovieListVM.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieDataService.h"

@interface MovieListVM : NSObject

@property (nonatomic, strong) NSString *cellReuseID;
@property (nonatomic, strong) NSMutableArray *movieTableCellVMs;
@property (nonatomic, assign) BOOL movieTableCellVMsUpdated;

- (instancetype)initWithServiceType:(MovieDataServiceType)serviceType;

@end
