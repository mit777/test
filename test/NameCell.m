//
//  NameTableViewCell.m
//  test
//
//  Created by buti on 2014/07/06.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

- (void)awakeFromNib
{
    // Initialization code
    _nameTextField.delegate = self;
    NSLog(@"awakeFromNib");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    NSLog(@"setSelected %d",selected);
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
// よばれない
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"initWithStyle");
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    // よばれない
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"initWithFrame");
    }
    return self;
}

// UITextField delegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

// Returnボタンがタップされた時に呼ばれる
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSLog(@"textFieldShouldReturn:%@",textField.text);
    // キーボードを閉じる
    [textField resignFirstResponder];
    return YES;
}


@end
