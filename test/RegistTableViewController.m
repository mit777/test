//
//  RegistTableViewController.m
//  test
//
//  Created by buti on 2014/07/07.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//
// TODO: 各値取得、エンターキーで移動、http


#import "RegistTableViewController.h"
#import "NameCell.h"
#import "UserIdCell.h"
#import "PasswordCell.h"
#import "UrlCell.h"
#import "KeyCell.h"
#import "IntervalCell.h"


// セル識別
typedef NS_ENUM(NSInteger, CELL_TAG){
    NAME_CELL=0,
    USERID_CELL,
    PASSWORD_CELL,
    URL_CELL,
    KEY_CELL,
    INTERVAL_CELL
};

@interface RegistTableViewController ()

@end

@implementation RegistTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.navigationItem.title = @"Regist";
    
    // iOS 6.0以降からのセル再利用の設定（xibの場合）
    // http://blog.morizotter.com/2013/01/23/the-easiest-way-to-make-custamcell-with-xib/
    // カスタムセル
    [self.tableView registerNib:[UINib nibWithNibName:@"NameCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserIdCell" bundle:nil] forCellReuseIdentifier:@"UserIdCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PasswordCell" bundle:nil] forCellReuseIdentifier:@"PasswordCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"UrlCell" bundle:nil] forCellReuseIdentifier:@"UrlCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"KeyCell" bundle:nil] forCellReuseIdentifier:@"KeyCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"IntervalCell" bundle:nil] forCellReuseIdentifier:@"IntervalCell"];
    // 通常のセル
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// セクション数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

// セル数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 1) {
        return 1;
    }
    return 6;
}

// セルを設定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        // 入力項目
        if (indexPath.row == NAME_CELL) {
            // name
            NameCell *nameCell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
            nameCell.nameTextField.placeholder = @"input name";
            cell = (UITableViewCell*)nameCell;
            
        }else if (indexPath.row == USERID_CELL){
            // userid
            UserIdCell *userIdCell = [tableView dequeueReusableCellWithIdentifier:@"UserIdCell" forIndexPath:indexPath];
            cell = (UITableViewCell*)userIdCell;

            
        }else if (indexPath.row == PASSWORD_CELL){
            // password
            PasswordCell *passwordCell = [tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
            cell = (UITableViewCell*)passwordCell;
            
        }else if (indexPath.row == URL_CELL){
            // url
            UrlCell *urlCell = [tableView dequeueReusableCellWithIdentifier:@"UrlCell" forIndexPath:indexPath];
            cell = (UITableViewCell*)urlCell;
            
        }else if (indexPath.row == KEY_CELL){
            // key
            KeyCell *keyCell = [tableView dequeueReusableCellWithIdentifier:@"KeyCell" forIndexPath:indexPath];
            cell = (UITableViewCell*)keyCell;
            
        
        }else{
            // interval
            IntervalCell *intervalCell = [tableView dequeueReusableCellWithIdentifier:@"IntervalCell" forIndexPath:indexPath];
            
            // 選択状態
            intervalCell.intervalSC.selectedSegmentIndex = 1;
//            [intervalCell.intervalSC insertSegmentWithTitle:@"test" atIndex:0 animated:YES];
            
            cell = (UITableViewCell*)intervalCell;

        }
        
    }else{
        // ボタン
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = @"Regist";
        cell.textLabel.textColor = [UIColor blueColor];

    }
    return cell;
}

// セルをタップした時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"お知らせ"
                              message:@"完了しました"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// セルの高さ設定
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 基本は44
    NSInteger height=44;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case URL_CELL:
            case KEY_CELL:
            case INTERVAL_CELL:
                height =88;
                break;
                
            default:
                break;
        }
        
    }
    return height;
}
@end
