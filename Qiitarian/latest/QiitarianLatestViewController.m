//
//  QiitarianLatestViewController.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/18.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestViewController.h"
#import "QiitarianLatestItemsFetcher.h"
#import "QiitarianLatestItem.h"
#import "QiitarianLatestItemList.h"
#import "QiitarianArticleCell.h"
#import "QiitarianDetailViewController.h";

@interface QiitarianLatestViewController () {
@private
    int _currentPage;
    BOOL _isUpdating;
    QiitarianLatestItemList *_qiitarianLatestItemList;
    
    NSDateFormatter *_formatter;
}


@end

@implementation QiitarianLatestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl = refreshControl;
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    
    _qiitarianLatestItemList = [[QiitarianLatestItemList alloc] initWithQiitarianList:@[]];
    _currentPage = 1;
    _isUpdating = NO;
    
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    QiitarianLatestItemsFetcher *fetcher = [[QiitarianLatestItemsFetcher alloc] init];
    [fetcher fetch:^(QiitarianLatestItemList *array) {
        _qiitarianLatestItemList = array;
        [self.tableView reloadData];
    }];
}

- (void)onRefresh:(id)sender {
    [self.refreshControl beginRefreshing];
    QiitarianLatestItemsFetcher *fetcher = [[QiitarianLatestItemsFetcher alloc] init];
    [fetcher fetch:^(QiitarianLatestItemList *array) {
        _qiitarianLatestItemList = [_qiitarianLatestItemList mergeToHead:array];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Table View用プロトコルの実装
//-------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_qiitarianLatestItemList.itemList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QiitarianArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell"];
    if (cell == nil) {
        cell = [[QiitarianArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"articleCell"];
    }
    
    QiitarianLatestItem *item = _qiitarianLatestItemList.itemList[indexPath.row];
    cell.titleLabel.text = item.title;
    cell.dateLabel.text = [_formatter stringFromDate:item.createdAt];
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height)) {
        NSLog(@"bottom!!");
        
        if (_isUpdating) {
            return;
        }
        if (10 <= _currentPage) {
            return;
        }
        
        //最下部への記事追加
        _isUpdating = YES;
        QiitarianLatestItemsFetcher *fetcer = [[QiitarianLatestItemsFetcher alloc] init];
        [fetcer fetch:^(QiitarianLatestItemList *array) {
            _qiitarianLatestItemList = [_qiitarianLatestItemList mergeToLast:array];
            [self.tableView reloadData];
            _isUpdating = NO;
        } index:++_currentPage];
    }
}
//-------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"go_detail"]) {
        QiitarianLatestItem *item = _qiitarianLatestItemList.itemList[self.tableView.indexPathForSelectedRow.row];
        
        QiitarianDetailViewController *next = segue.destinationViewController;
        next.uuid = item.uuid;
    }
}

@end
