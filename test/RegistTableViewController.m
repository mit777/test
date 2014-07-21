//
//  RegistTableViewController.m
//  test
//
//  Created by buti on 2014/07/07.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//
// TODO: http


#import "RegistTableViewController.h"
#import "NameCell.h"
#import "UserIdCell.h"
#import "PasswordCell.h"
#import "UrlCell.h"
#import "KeyCell.h"
#import "IntervalCell.h"
#import "Account.h"


// セル識別
typedef NS_ENUM(NSInteger, CELL_TAG){
    CELL_NAME=0,
    CELL_USERID,
    CELL_PASSWORD,
    CELL_URL,
    CELL_KEY,
    CELL_INTERVAL
};

// Intervalの添字
typedef NS_ENUM(NSInteger, INTERVAL_CNT){
    INTERVAL_30=0,
    INTERVAL_60,
};

@interface RegistTableViewController ()

// インスタンス変数
@property Account *account;

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

// View が表示される直前に呼ばれるメソッド
-(void)viewWillAppear:(BOOL)animated
{
    // Accountを生成
    _account = [[Account alloc]init];
    _account.url = @"http://";
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
        if (indexPath.row == CELL_NAME) {
            // name
            NameCell *nameCell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
            nameCell.nameTextField.text = _account.name;
            nameCell.nameTextField.placeholder = @"input name";
            nameCell.nameTextField.delegate = self;
            nameCell.nameTextField.tag = CELL_NAME;
            cell = (UITableViewCell*)nameCell;
            
        }else if (indexPath.row == CELL_USERID){
            // userid
            UserIdCell *userIdCell = [tableView dequeueReusableCellWithIdentifier:@"UserIdCell" forIndexPath:indexPath];
            userIdCell.userIdTextField.delegate = self;
            userIdCell.userIdTextField.tag = CELL_USERID;
            cell = (UITableViewCell*)userIdCell;

            
        }else if (indexPath.row == CELL_PASSWORD){
            // password
            PasswordCell *passwordCell = [tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
            passwordCell.passwordTextField.text = _account.password;
            passwordCell.passwordTextField.delegate = self;
            passwordCell.passwordTextField.tag = CELL_PASSWORD;
            cell = (UITableViewCell*)passwordCell;
            
        }else if (indexPath.row == CELL_URL){
            // url
            UrlCell *urlCell = [tableView dequeueReusableCellWithIdentifier:@"UrlCell" forIndexPath:indexPath];
            urlCell.urlTextField.text = _account.url;
            // 変更可否(YES:変更可,NO:変更不可)
            urlCell.urlTextField.enabled = YES;
            urlCell.urlTextField.delegate = self;
            urlCell.urlTextField.tag = CELL_URL;

            
            cell = (UITableViewCell*)urlCell;
            
        }else if (indexPath.row == CELL_KEY){
            // key
            KeyCell *keyCell = [tableView dequeueReusableCellWithIdentifier:@"KeyCell" forIndexPath:indexPath];
            keyCell.keyTextField.text = _account.key;
            keyCell.keyTextField.delegate = self;
            keyCell.keyTextField.tag = CELL_KEY;
            keyCell.keyTextField.keyboardType = UIKeyboardTypeASCIICapable;
            cell = (UITableViewCell*)keyCell;
            
        
        }else{
            // interval
            IntervalCell *intervalCell = [tableView dequeueReusableCellWithIdentifier:@"IntervalCell" forIndexPath:indexPath];
            
            // 初期状態の選択位置
            if (_account.intarval == 30) {
                intervalCell.intervalSC.selectedSegmentIndex = INTERVAL_30;
            }else{
                intervalCell.intervalSC.selectedSegmentIndex = INTERVAL_60;
            }

            
            // セグメントのタイトル
            [intervalCell.intervalSC setTitle:@"30s" forSegmentAtIndex:INTERVAL_30];
            [intervalCell.intervalSC setTitle:@"60s" forSegmentAtIndex:INTERVAL_60];
            // 変更可否(YES:変更可,NO:変更不可)
            intervalCell.intervalSC.enabled = YES;
            
            // セグメントコントロールの値がかわった際に呼び出されるメソッドを指定
            [intervalCell.intervalSC addTarget:self
                                        action:@selector(segmentChanged:)
                              forControlEvents:UIControlEventValueChanged];

            cell = (UITableViewCell*)intervalCell;

        }
        // タップ時のハイライトを無効化
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    // ハイライトの解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *msg = [NSString stringWithFormat:
                     @"name:[%@]\nuserID:[%@]\npassword:[%@]\nurl:[%@]\nkey:[%@]\ninterval:[%d]",
                     _account.name,_account.userId,_account.password,_account.url,_account.key,_account.intarval];
    
    if (indexPath.section == 1) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"result"
                              message:msg
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
            case CELL_URL:
            case CELL_KEY:
            case CELL_INTERVAL:
                height =88;
                break;
                
            default:
                break;
        }
        
    }
    return height;
}

// セグメントコントロールの値が変わった際に、呼び出されるメソッド
-(void)segmentChanged:(id)sender {
    
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if (control.selectedSegmentIndex == INTERVAL_30) {
        _account.intarval = 30;
    }else{
        _account.intarval = 60;
    }
    NSLog(@"intarval value = %d", _account.intarval);
}

// UITextFieldのdelegate

// Returnボタンがタップされた時に呼ばれる
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSLog(@"textFieldShouldReturn:%@",textField.text);
    // キーボードを閉じる
    [textField resignFirstResponder];
     return YES;
}

// テキストフィールドの編集が終了する直後に呼び出される
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidEndEditing:%@",textField.text);
    // インスタンス変数に値をセット
    switch (textField.tag) {
        case CELL_NAME:
            _account.name = textField.text;
            break;
        case CELL_USERID:
            _account.userId = textField.text;
            break;
        case CELL_PASSWORD:
            _account.password = textField.text;
            break;
        case CELL_URL:
            _account.url = textField.text;
            break;
        case CELL_KEY:
            _account.key = textField.text;
            break;
        default:
            break;
    }
}
#define MAX_LENGTH 8
/**
 * テキストフィールドが編集された時に呼び出される
 * @param textField イベントが発生したテキストフィールド
 * @param range 文字列が置き換わる範囲(入力された範囲)
 * @param string 置き換わる文字列(入力された文字列)
 * @retval YES 入力を許可する場合
 * @retval NO 許可しない場合
 */
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"range.location:%d range.length:%d string:%@",range.location, range.length, string);
    
// TODO: 区切る処理
    // 入力後のテキスト
    NSString *result = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"result:%@",result);
    
//    if (textField.tag == CELL_KEY) {
//        <#statements#>
//    }
    
//    if(textField.text.length == 0 || [string isEqualToString:@""]){
    if(textField.text.length == 0 ){
        // 入力前の値が0文字 または　バックスペースが入力されたの合は何もしない
        return YES;
    }

    // abcdefghi
    if([string isEqualToString:@""]){
        // バックスペースの場合は何もしない
        return YES;
    }

    // すでに入力されているテキストを取得
    NSMutableString *text = [textField.text mutableCopy];

    int kugiri = text.length % 4;
    if (kugiri == 0) {
        [text appendString:@"-"];
    }
    textField.text = text;

    return YES;
//    // すでに入力されているテキストを取得
//    NSMutableString *text = [textField.text mutableCopy];
//    
//    // すでに入力されているテキストに今回編集されたテキストをマージ
//    [text replaceCharactersInRange:range withString:string];
//    
//    NSLog(@"length:%d %d",textField.text.length, [text length]);
//    // 結果が文字数をオーバーしていないならYES，オーバーしている場合はNO
//    return ([text length] <= MAX_LENGTH);
}
@end
