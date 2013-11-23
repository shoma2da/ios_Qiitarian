//
//  QiitarianLatestItems.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestItem.h"

@implementation QiitarianLatestItem {
    __strong NSDictionary *_keyValueMap;
}

- (QiitarianLatestItem *)initWithKeyValueMap:(NSDictionary *)keyValueMap {
    _keyValueMap = keyValueMap;
    return self;
}

- (NSString *)title {
    return _keyValueMap[@"title"];
}

@end
