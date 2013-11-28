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
    
    //日付
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
    _createdAt = [formatter dateFromString:keyValueMap[@"created_at"]];
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
