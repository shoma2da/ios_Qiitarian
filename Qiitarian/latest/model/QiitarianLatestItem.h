//
//  QiitarianLatestItems.h
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/22.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiitarianLatestItem : NSObject

- (QiitarianLatestItem *) initWithKeyValueMap:(NSDictionary *)keyValueMap;
- (NSString *)title;

@end
