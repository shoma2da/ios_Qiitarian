//
//  QiitarianLatestItemList.h
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/25.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiitarianLatestItemList : NSObject

@property(nonatomic, readonly) NSArray *itemList;

- (QiitarianLatestItemList *) initWithQiitarianList:(NSArray *)itemList;
- (QiitarianLatestItemList *) merge:(QiitarianLatestItemList *)afterList;

@end
