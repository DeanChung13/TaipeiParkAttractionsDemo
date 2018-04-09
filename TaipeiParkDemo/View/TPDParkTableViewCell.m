//
//  TPDParkTableViewCell.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDParkTableViewCell.h"
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

- (void)setupData:(NSNumber *)data {
  self.parkNameLabel.text = [data stringValue];
}


@end
