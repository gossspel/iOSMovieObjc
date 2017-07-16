//
//  MovieListTVC.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/12/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieListTVC.h"
#import "MovieListVM.h"
#import "MovieTableCellVM.h"
#import "MovieTableCell.h"

@interface MovieListTVC ()

@property (nonatomic, strong) MovieListVM *VM;

// TODO: follow the approach below
// http://codeplease.io/2016/01/10/cells-and-viewmodels/

@end

@implementation MovieListTVC

- (instancetype)initWithServiceType:(MovieDataServiceType)serviceType {
    self = [super init];
    if (self) {
        self.VM = [[MovieListVM alloc] initWithServiceType:serviceType];
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    [self.tableView registerClass:[MovieTableCell class] forCellReuseIdentifier:self.VM.cellReuseID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addKVO];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)dealloc {
    [self removeKVO];
}

#pragma mark - KVO
- (void)addKVO {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew;
    [self.VM addObserver:self forKeyPath:@"movieTableCellVMsUpdated" options:options context:nil];
}

- (void)removeKVO {
    [self.VM removeObserver:self forKeyPath:@"movieTableCellVMsUpdated"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"movieTableCellVMsUpdated"]) {
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.VM.movieTableCellVMs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.VM.cellReuseID forIndexPath:indexPath];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableCellVM *cellVM = self.VM.movieTableCellVMs[indexPath.row];
    MovieTableCell *customCell = (MovieTableCell *) cell;
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew;
    [cellVM addObserver:customCell forKeyPath:@"titleLabelText" options:options context:nil];
    [cellVM addObserver:customCell forKeyPath:@"overviewLabelText" options:options context:nil];
    [cellVM addObserver:customCell forKeyPath:@"imageURLStr" options:options context:nil];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableCellVM *cellVM = self.VM.movieTableCellVMs[indexPath.row];
    MovieTableCell *customCell = (MovieTableCell *) cell;
    [cellVM removeObserver:customCell forKeyPath:@"titleLabelText"];
    [cellVM removeObserver:customCell forKeyPath:@"overviewLabelText"];
    [cellVM removeObserver:customCell forKeyPath:@"imageURLStr"];
}

@end
