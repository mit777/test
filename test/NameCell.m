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
