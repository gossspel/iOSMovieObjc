//
//  MovieTableCell.h
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableCell : UITableViewCell

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context;

@end
