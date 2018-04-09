//
//  TPDParkTableViewCellViewModel.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDParkTableViewCellViewModel.h"

@interface TPDParkTableViewCellViewModel()

@end

@implementation TPDParkTableViewCellViewModel

- (instancetype)initWithRawData:(NSDictionary *)rawDict {
  if ( self = [super init] ) {
    NSString *park = rawDict[@"ParkName"];
    NSString *name = rawDict[@"Name"];
    _parkName = [NSString stringWithFormat:@"%@ %@", park, name];
    _parkIntroduction = rawDict[@"Introduction"];
  }
  return self;
}
@end
