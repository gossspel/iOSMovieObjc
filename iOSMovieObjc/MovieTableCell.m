//
//  MovieTableCell.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieTableCell.h"

@interface MovieTableCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *overviewLabel;
@property (nonatomic, strong) UIImageView *posterImageView;

@end

@implementation MovieTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Note: have to initialize properties here since Objective C doesn't allow default value for properties unlike Swift.
        self.titleLabel = [[UILabel alloc] init];
        self.overviewLabel = [[UILabel alloc] init];
        self.posterImageView = [[UIImageView alloc] init];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"titleLabelText"]) {
        NSString *initialValue = [change valueForKey:NSKeyValueChangeNotificationIsPriorKey];
        NSString *newValue = [change valueForKey:NSKeyValueChangeNewKey];
        
        if (newValue != nil) {
            self.titleLabel.text = newValue;
        } else {
            self.titleLabel.text = initialValue;
        }
    }
    
    if ([keyPath isEqualToString:@"overviewLabelText"]) {
        NSString *initialValue = [change valueForKey:NSKeyValueChangeNotificationIsPriorKey];
        NSString *newValue = [change valueForKey:NSKeyValueChangeNewKey];
        
        if (newValue != nil) {
            self.overviewLabel.text = newValue;
        } else {
            self.overviewLabel.text = initialValue;
        }
    }
}

@end
