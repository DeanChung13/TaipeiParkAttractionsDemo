//
//  TPDAPIManager.m
//  TaipeiParkDemo
//
//  Created by DeanChung on 2018/4/9.
//  Copyright © 2018 DeanChung. All rights reserved.
//

#import "TPDAPIManager.h"

@implementation TPDAPIManager

+ (void)requestTaipeiParkListWithOffset:(NSUInteger)offset
                             completion:(TaipeiParkListRequestCompletion)completion {
  NSString *urlString = @"http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=bf073841-c734-49bf-a97f-3757a6013812&limit=30";
  urlString = [urlString stringByAppendingFormat:@"&offset=%@", @(offset)];

  NSURL *url = [NSURL URLWithString:urlString];
  NSURLSessionTask *sessionTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if ( error ) {
      NSLog(@"%@", error);
      completion(nil, error);
    }

    NSError *jsonError = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];

    if ( jsonError ) {
      NSLog(@"Can't parse JSON data");
      completion(nil, jsonError);
    }

    if ( completion ) {
      NSDictionary *resultDict = jsonDict[@"result"];
      NSArray *resultArray = resultDict[@"results"];
      if ( resultArray.count > 0 ) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(resultArray, nil);
        });
      }
    }

  }];
  [sessionTask resume];
}
@end
