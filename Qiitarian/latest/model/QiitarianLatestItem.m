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
    _id = [(NSNumber *)keyValueMap[@"id"] intValue];
    _title = keyValueMap[@"title"];
    _createdAt = keyValueMap[@"created_at"];
    return self;
}

- (BOOL)isEqual:(id)object {
    if (object == NULL) {
        return NO;
    }
    if ([object isKindOfClass:[QiitarianLatestItem class]] == NO) {
        return NO;
    }
    
    QiitarianLatestItem *item = (QiitarianLatestItem *)object;
    return item.id == self.id;
}

@end
