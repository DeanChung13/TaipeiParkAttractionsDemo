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
#import "TPDAPIManager.h"
#import "TPDParkTableViewCellViewModel.h"

@interface TPDParkListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet TPDParkListTableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *parkList;
@end

@implementation TPDParkListViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupNavigationBar];
  [self setupTableView];
  [self loadParkData];
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

- (void)loadParkData {
  [TPDAPIManager requestTaipeiParkListWithOffset:0
                                      completion:^(NSArray *jsonArray, NSError *error) {
                                        NSLog(@"%@", jsonArray);
                                        [self.parkList addObjectsFromArray:jsonArray];
                                        [self.mainTableView reloadData];
  }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.parkList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TPDParkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TPDParkTableViewCell.identifier
                                                               forIndexPath:indexPath];
  TPDParkTableViewCellViewModel *viewModel = [[TPDParkTableViewCellViewModel alloc] initWithRawData:self.parkList[indexPath.row]];
  [cell setupWithViewModel:viewModel];
  return cell;
}

#pragma mark - Setters & Getters
- (NSMutableArray *)parkList {
  if ( !_parkList ) {
    _parkList = [NSMutableArray array];
  }
  return _parkList;
}

@end
