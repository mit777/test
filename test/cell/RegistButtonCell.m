//
//  RegistButtonCell.m
//  test
//
//  Created by buti on 2014/07/07.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "RegistButtonCell.h"

@implementation RegistButtonCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Registボタンが押された時
- (IBAction)regist:(id)sender {
    NSLog(@"### regist");
}
@end
