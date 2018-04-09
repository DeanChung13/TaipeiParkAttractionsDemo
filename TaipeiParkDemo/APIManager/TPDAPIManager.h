//
//  TPDAPIManager.h
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TaipeiParkListRequestCompletion)(NSArray *jsonArray, NSError *error);

@interface TPDAPIManager : NSObject
+ (void)requestTaipeiParkListWithOffset:(NSUInteger)offset completion:(TaipeiParkListRequestCompletion)completion;
@end
