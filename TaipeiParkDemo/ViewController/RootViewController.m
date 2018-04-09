//
//  RootViewController.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "RootViewController.h"
#import "DemoOneViewController.h"

NSString * const CellIdentifier = @"CellIdentifier";
NSString * const MainStoryboardName = @"Main";
NSString * const DemoOneVC = @"DemoOneVC";

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *demoList;
@end


@implementation RootViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Demo List";
}

#pragma mark - Private Methods
- (void)pushViewControllerWithName:(NSString *)vcName {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:MainStoryboardName bundle:nil];
  DemoOneViewController *demoOneVC = [storyboard instantiateViewControllerWithIdentifier:DemoOneVC];
  [self.navigationController pushViewController:demoOneVC animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.demoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  cell.textLabel.text = self.demoList[indexPath.row];
  return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.row) {
    case 0:
      [self pushViewControllerWithName:DemoOneVC];
      break;

    default:
      break;
  }
}

#pragma mark - Setters & Getters
- (NSArray *)demoList {
  if ( !_demoList ) {
    _demoList = @[ @"Demo1", @"Demo2" ];
  }
  return _demoList;
}
@end
