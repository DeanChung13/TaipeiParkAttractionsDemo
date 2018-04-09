//
//  TPDParkTableViewCell.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDParkTableViewCell.h"
#import "TPDParkTableViewCellViewModel.h"

NSString * const TPDParkTableViewCellIdentifier = @"TPDParkTableViewCellIdentifier";

@interface TPDParkTableViewCell ()
@property (nonatomic, weak) IBOutlet UILabel *parkNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *parkIntroductionLabel;
@end

@implementation TPDParkTableViewCell

+ (NSString *)identifier {
  return TPDParkTableViewCellIdentifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setupWithViewModel:(TPDParkTableViewCellViewModel *)viewModel {
  self.parkNameLabel.text = viewModel.parkName;
  self.parkIntroductionLabel.text = viewModel.parkIntroduction;
}


@end
