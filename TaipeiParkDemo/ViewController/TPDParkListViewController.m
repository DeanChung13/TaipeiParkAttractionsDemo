//
//  TPDParkListViewController.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDParkListViewController.h"
#import "TPDParkListTableView.h"
#import "TPDParkTableViewCell.h"
#import "TPDConstants.h"

@interface TPDParkListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet TPDParkListTableView *mainTableView;
@property (nonatomic, strong) NSArray *demoData;
@end

@implementation TPDParkListViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupNavigationBar];
  [self setupTableView];
}

#pragma mark - Private methods
- (void)setupNavigationBar {
  self.navigationController.navigationBar.barTintColor = [UIColor tpdNavigationBarColor];
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  self.title = @"我是 Navigation bar";
  self.navigationController.navigationBar.titleTextAttributes =
  @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
  self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)setupTableView {
  self.mainTableView.contentInset = UIEdgeInsetsMake(140.0, 0, 0, 0);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.demoData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TPDParkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TPDParkTableViewCell.identifier
                                                               forIndexPath:indexPath];
  [cell setupData:self.demoData[indexPath.row]];
  return cell;
}

#pragma mark - Setters & Getters
- (NSArray *)demoData {
  if ( !_demoData ) {
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:100];
    for (NSInteger index = 0; index < 100; index++) {
      [tempArray addObject:@(index)];
    }
    _demoData = [tempArray copy];
  }
  return _demoData;
}


@end
