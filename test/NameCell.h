//
//  NameTableViewCell.h
//  test
//
//  Created by 石神 光昭 on 2014/07/06.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameCell : UITableViewCell

@property NSString *NameText;
// ラベル
@property (weak, nonatomic) IBOutlet UILabel *Name;

// テキストフィールド
- (IBAction)NameText:(UITextField *)sender;

@end
