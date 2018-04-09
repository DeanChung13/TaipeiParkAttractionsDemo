//
//  TPDParkTableViewCell.h
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPDParkTableViewCellViewModel;

@interface TPDParkTableViewCell : UITableViewCell
+ (NSString *)identifier;
- (void)setupWithViewModel:(TPDParkTableViewCellViewModel *)viewModel;
@end
