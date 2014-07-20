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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)NameText:(UITextField *)sender {
    NSLog(@"name =[%@]",sender.text);
    _NameText = sender.text;
}

@end
