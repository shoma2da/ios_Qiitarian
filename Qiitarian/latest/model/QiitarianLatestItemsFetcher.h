//
//  QiitarianLatestItemsFetcher.h
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiitarianLatestItemsFetcher : NSObject

- (void)fetch:(void (^)(NSArray *))onFinishAccess;
- (void)fetch:(void (^)(NSArray *))onFinishAccess index:(NSInteger)index;

@end
