//
//  QiitarianLatestItems.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestItems.h"

@implementation QiitarianLatestItems {
    __strong NSDictionary *_keyValueMap;
}

- (QiitarianLatestItems *)initWithKeyValueMap:(NSDictionary *)keyValueMap {
    _keyValueMap = keyValueMap;
    return self;
}

- (NSString *)title {
    return _keyValueMap[@"title"];
}

@end
