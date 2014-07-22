//
//  NameTableViewCell.h
//  test
//
//  Created by buti on 2014/07/06.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameCell : UITableViewCell <UITextFieldDelegate>
// ラベル
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

// テキストフィールド
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
