//
//  MainViewController.m
//  test
//
//  Created by 石神 光昭 on 2014/07/06.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "MainViewController.h"
#import "TestTableViewController.h"
#import "tmpViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
}

// ButtonをPUSH
- (IBAction)button:(id)sender {
    
    // TestTablewを生成
    TestTableViewController *testTableView = [[TestTableViewController alloc]initWithNibName:@"TestTableViewController" bundle:nil];

    // TestTableに遷移
    [self.navigationController pushViewController:testTableView animated:YES];

//    [self presentViewController:testTableView animated:YES completion:nil];
}

// tmpボタンをpush
- (IBAction)tmpButton:(UIButton *)sender {
    //tmp
    tmpViewController *tmpView = [[tmpViewController alloc]initWithNibName:@"tmpViewController" bundle:nil];
    [self.navigationController pushViewController:tmpView animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
