//
//  QiitarianLatestItemList.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/25.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestItemList.h"
#import "QiitarianLatestItem.h"

@implementation QiitarianLatestItemList

- (QiitarianLatestItemList *)initWithQiitarianList:(NSArray *)itemList {
    _itemList = itemList;
    return self;
}

- (QiitarianLatestItemList *) mergeToLast:(QiitarianLatestItemList *)itemList {
    NSMutableArray *srcArray = _itemList.mutableCopy;
    for (QiitarianLatestItem *item in itemList.itemList) {
        if ([srcArray containsObject:item] == NO) {
            [srcArray addObject:item];
        }
    }
    return [[QiitarianLatestItemList alloc] initWithQiitarianList:srcArray.copy];
}

- (QiitarianLatestItemList *) mergeToHead:(QiitarianLatestItemList *)itemList {
    NSMutableArray *srcArray = _itemList.mutableCopy;
    
    NSArray *reverseArray = [[itemList.itemList reverseObjectEnumerator] allObjects];
    for (QiitarianLatestItem *item in reverseArray) {
        if ([srcArray containsObject:item] == NO) {
            [srcArray insertObject:item atIndex:0];
        }
    }
    
    return [[QiitarianLatestItemList alloc] initWithQiitarianList:srcArray.copy];
}

@end
