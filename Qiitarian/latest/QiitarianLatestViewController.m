//
//  QiitarianLatestViewController.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/18.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestViewController.h"
#import "QiitarianLatestItemsFetcher.h"
#import "QiitarianLatestItems.h"

@interface QiitarianLatestViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;

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
    
    _list = @[].mutableCopy;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    QiitarianLatestItemsFetcher *fetcher = [[QiitarianLatestItemsFetcher alloc] init];
    [fetcher fetch:^(NSArray *array) {
        for (QiitarianLatestItems *items in array) {
            [_list addObject:items.title];
        }
        [_tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Table View用プロトコルの実装
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"id"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    NSString *title = [_list objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}
//-------------------------

@end
