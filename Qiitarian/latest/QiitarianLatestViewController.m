//
//  QiitarianLatestViewController.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/18.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestViewController.h"

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
- (IBAction)addCell:(id)sender {
    [_list addObject:@"ddd"];
    [_tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _list = @[].mutableCopy;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //URLアクセス
    NSURL *url = [NSURL URLWithString:@"http://qiita.com/api/v1/items"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (data == nil) {
            NSLog(@"Can't catch data");
            return;
        }
        
        //文字列として表示
        NSString *resultString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
        //JSONオブジェクトとして表示
        NSError *tempError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&tempError];
        NSLog(@"%@", jsonArray);
        NSLog(@"%d", [jsonArray count]);
        
        for (NSDictionary *dictionary in jsonArray) {
            [_list addObject:dictionary[@"title"]];
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
