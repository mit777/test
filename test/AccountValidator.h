//
//  AccountValidator.h
//  test
//
//  Created by buti on 2014/07/21.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface AccountValidator : NSObject


+(NSInteger)isAccountValid:(Account *)account;

@end
