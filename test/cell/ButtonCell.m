//
//  ButtonCell.m
//  test
//
//  Created by buti on 2014/09/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "ButtonCell.h"

@implementation ButtonCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10.0f;
    frame.size.width = 200.0f;
    [super setFrame:frame];
}

-(void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    [super layoutSubviews];
    
    // TODO iOS7のみ
    //枠線
    self.layer.borderWidth = 0.5f;
    //枠線の色
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //角丸
    self.layer.cornerRadius = 10.0f;
    //サブビューにも適応
    self.clipsToBounds = YES;
    

}

@end
