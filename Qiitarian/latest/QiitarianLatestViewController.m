//
//  QiitarianLatestViewController.m
//  Qiitarian
//
//  Created by Shoichi Matsuda on 2013/11/15.
//  Copyright (c) 2013年 Shoichi Matsuda. All rights reserved.
//

#import "QiitarianLatestViewController.h"

@interface QiitarianLatestViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickCenterButton:(id)sender {
    NSLog(@"hello");
}

@end