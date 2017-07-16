//
//  MovieTableCellVM.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieModel.h"

@interface MovieTableCellVM : NSObject

@property (nonatomic, strong) NSString *titleLabelText;
@property (nonatomic, strong) NSString *overviewLabelText;
@property (nonatomic, strong) NSString *imageURLStr;

- (instancetype)initWithMovie:(MovieModel *)movie;

@end
