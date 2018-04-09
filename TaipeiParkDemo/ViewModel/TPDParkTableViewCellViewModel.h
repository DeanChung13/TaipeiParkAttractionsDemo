//
//  TPDParkTableViewCellViewModel.h
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPDParkTableViewCellViewModel : NSObject
@property (nonatomic, readonly, copy) NSString *parkName;
@property (nonatomic, readonly, copy) NSString *parkIntroduction;

- (instancetype)initWithRawData:(NSDictionary *)rawDict;
@end
