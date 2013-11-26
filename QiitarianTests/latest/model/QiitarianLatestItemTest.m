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

- (void)testCanGetId {
    NSNumber *number = [[NSNumber alloc] initWithInt:315];
    QiitarianLatestItem *item = [[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"id" : number}];
    XCTAssertEqual([number intValue], item.id);
}

- (void)testCanGetTitle {
    QiitarianLatestItem *item = [[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"title" : @"SampleTitle"}];
    XCTAssertEqualObjects(@"SampleTitle", item.title);
}

- (void)testCanJudgeEqual {
    QiitarianLatestItem *item = [[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"id" : @315}];
    
    XCTAssertFalse([item isEqual:NULL]);
    XCTAssertFalse([item isEqual:@""]);
    XCTAssertFalse([item isEqual:[[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"id" : @1}]]);
    XCTAssertTrue([item isEqual:[[QiitarianLatestItem alloc] initWithKeyValueMap:@{@"id" : @315}]]);
}

@end
