//
//  QiitarianLatestItemsFetcher.h
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QiitarianLatestItemList;

@interface QiitarianLatestItemsFetcher : NSObject

- (void)fetch:(void (^)(QiitarianLatestItemList *))onFinishAccess;
- (void)fetch:(void (^)(QiitarianLatestItemList *))onFinishAccess index:(NSInteger)index;

@end
