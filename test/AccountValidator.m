//
//  AccountValidator.m
//  test
//
//  Created by buti on 2014/07/21.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "AccountValidator.h"
#import "Const.h"

@implementation AccountValidator

// アカウントのバリデーションチェック
+(NSInteger)isAccountValid:(Account *)account
{
    if ([account.key isEqualToString:@""]) {
        return invalidKey;
    }
    return ok;
}

@end
