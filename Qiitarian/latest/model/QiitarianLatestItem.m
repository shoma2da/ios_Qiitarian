//
//  QiitarianLatestItems.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestItem.h"

@implementation QiitarianLatestItem

- (QiitarianLatestItem *)initWithKeyValueMap:(NSDictionary *)keyValueMap {
    _title = keyValueMap[@"title"];
    return self;
}

@end
