//
//  QiitarianLatestItemTest.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/26.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QiitarianLatestItem.h"

@interface QiitarianLatestItemTest : XCTestCase

@end

@implementation QiitarianLatestItemTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testIDを取得できる {
    QiitarianLatestItem *item = [[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"id" : @315}];
    XCTAssertEqual(315, item.id);
}

- (void)testTitleを取得できる {
    QiitarianLatestItem *item = [[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"title" : @"SampleTitle"}];
    XCTAssertEqualObjects(@"SampleTitle", item.title);
}

@end
