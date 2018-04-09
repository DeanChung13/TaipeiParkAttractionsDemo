//
//  TPDParkListTableView.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDParkListTableView.h"

@implementation TPDParkListTableView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
  UIView *view = [super hitTest:point withEvent:event];
  return ( point.y < 0 ) ? nil : view;
}
@end
