//
//  TestTableViewController.m
//  test
//
//  Created by buti on 2014/07/06.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "TestTableViewController.h"
#import "NameCell.h"
#import "RegistButtonCell.h"
#import "RegistTableViewController.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    // カスタムセル
    UINib *nameNib = [UINib nibWithNibName:@"NameCell" bundle:nil];
//    UINib *registNib = [UINib nibWithNibName:@"RegistButtonCell" bundle:nil];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:@"NameCell"];
//    [self.tableView registerNib:registNib forCellReuseIdentifier:@"RegistCell"];
    
    //
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...

    UITableViewCell *cell;
    NSLog(@"%d %d",indexPath.section, indexPath.row);
    if (indexPath.section == 0) {
        if(indexPath.row == 0 ){
//            cell = [tableView dequeueReusableCellWithIdentifier:@"RegistCell"];
            // 登録セル
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            }
            cell.textLabel.text = @"Regist";
        }
        
    }else{
        
        if (indexPath.row == 1){
            NameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell"];
            return cell;
        }
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row]; // 何番目のセルかを表示させました
    }
    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// セルが選択された時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        // Registセルが選択された時
        RegistTableViewController *registView = [[RegistTableViewController alloc] initWithNibName:@"RegistTableViewController" bundle:nil];
        
        // Push the view controller.
        [self.navigationController pushViewController:registView animated:YES];
    }
}

// セッションヘッダーを設定
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 1:
            return @"all users";
            
        default:
            break;
    }
    return @"";
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 1:
            return @"footter aaaaaaaaaaaaa\naaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
            
        default:
            break;
    }
    return @"";
}

@end
