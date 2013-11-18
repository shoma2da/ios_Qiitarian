//
//  QiitarianLatestFetcher.h
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/16.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiitarianLatestFetcher : NSObject {
    @private UITableView* tableView;
}

- (void) fetch;
- (id) initWithTableView:(UITableView *)uiTableView;

@end
