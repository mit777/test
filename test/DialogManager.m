//
//  DialogManager.m
//  test
//
//  Created by buti on 2014/07/21.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "DialogManager.h"

@implementation DialogManager

// エラーコードに対応したalertを返す
+(UIAlertView *)errorAlertDialog:(NSInteger)errorCode
{
    NSString *title;
    NSString *errorMessage;
    NSString *button;
    
    switch (errorCode) {
        case invalidKey:
            title = @"aaa";
            errorMessage = @"invalidKey";
            button = @"aaa ok";
            break;
        case invalidUrl:
            title = @"bbb";
            errorMessage = @"invalidUrl";
            button = @"bbb ok";
            break;
            
        default:
            errorMessage = @"intarnal error";
            button = @"ok";
            break;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = title;
    alert.message = errorMessage;
    [alert addButtonWithTitle:button];
    
    return alert;
}
@end
