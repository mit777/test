//
//  Account.m
//  test
//
//  Created by buti on 2014/07/21.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "Account.h"

@implementation Account

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"";
        _userId = @"";
        _password = @"";
        _url = @"";
        _key = @"";
        _intarval = 30;
    }
    return self;
}
@end
