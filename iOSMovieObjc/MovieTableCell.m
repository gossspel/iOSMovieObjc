//
//  MovieTableCell.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieTableCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieTableCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *overviewLabel;
@property (nonatomic, strong) UIImageView *posterImageView;

@end

@implementation MovieTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.overviewLabel];
        [self.contentView addSubview:self.posterImageView];
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = NSDictionaryOfVariableBindings(_titleLabel, _overviewLabel, _posterImageView);
    
    NSArray *posterToTitleHConstraints = [NSLayoutConstraint
                                          constraintsWithVisualFormat:@"H:|-[_posterImageView(80)][_titleLabel]-|"
                                          options:0
                                          metrics:nil
                                          views:views];
    
    NSArray *posterToOverviewHConstraints = [NSLayoutConstraint
                                             constraintsWithVisualFormat:@"H:|-[_posterImageView][_overviewLabel]-|"
                                             options:0
                                             metrics:nil
                                             views:views];
    
    NSArray *titleToOverviewVConstraints = [NSLayoutConstraint
                                            constraintsWithVisualFormat:@"V:|-[_titleLabel][_overviewLabel]-|"
                                            options:0
                                            metrics:nil
                                            views:views];
    
    NSArray *posterVConstraints = [NSLayoutConstraint
                                   constraintsWithVisualFormat:@"V:|-[_posterImageView(100)]-|"
                                   options:0
                                   metrics:nil
                                   views:views];
    
    [constraints addObjectsFromArray:posterToTitleHConstraints];
    [constraints addObjectsFromArray:posterToOverviewHConstraints];
    [constraints addObjectsFromArray:titleToOverviewVConstraints];
    [constraints addObjectsFromArray:posterVConstraints];
    [self.contentView addConstraints:constraints];
}

- (UILabel *)titleLabel {
    // Note: lazy load titleLabel
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.minimumScaleFactor = 0.5;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        _titleLabel.numberOfLines = 1;
    }
    
    return _titleLabel;
}

- (UILabel *)overviewLabel {
    // Note: lazy load overviewLabel
    if (_overviewLabel == nil) {
        _overviewLabel = [[UILabel alloc] init];
        _overviewLabel.text = @"";
        _overviewLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _overviewLabel.adjustsFontSizeToFitWidth = YES;
        _overviewLabel.minimumScaleFactor = 0.5;
        _overviewLabel.font = [UIFont boldSystemFontOfSize:14.0];
        _overviewLabel.numberOfLines = 4;
    }
    
    return _overviewLabel;
}

- (UIImageView *)posterImageView {
    // Note: lazy load posterImageView
    if (_posterImageView == nil) {
        _posterImageView = [[UIImageView alloc] init];
        _posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _posterImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _posterImageView;
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
    
    if ([keyPath isEqualToString:@"imageURLStr"]) {
        NSString *initialValue = [change valueForKey:NSKeyValueChangeNotificationIsPriorKey];
        NSString *newValue = [change valueForKey:NSKeyValueChangeNewKey];
        
        if (newValue != nil) {
            [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:newValue]];
        } else {
            [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:initialValue]];
        }
    
    }
}

@end
