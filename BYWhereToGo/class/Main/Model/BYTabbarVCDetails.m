//
//  BYTabbarVCDetails.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYTabbarVCDetails.h"

@implementation BYTabbarVCDetails

+(NSArray *)makeTabbarVCDetails
{
    NSArray *array    = @[ @{@"title":@"订单服务",
                             @"pic":@"order_normal",
                             @"selectPic":@"order_click"},
                           
                           @{@"title":@"语音",
                             @"pic":@"voice",
                             @"selectPic":@"voice"},
                           
                           @{@"title":@"首页",
                             @"pic":@"firstpage_normal",
                             @"selectPic":@"firstpage_click"},
                           
                           @{@"title":@"发现",
                             @"pic":@"discover_normal",
                             @"selectPic":@"discover_click"},
                           
                           @{@"title":@"我的",
                             @"pic":@"mine_normal",
                             @"selectPic":@"mine_click"},
                           ];
    
    return array;
}


@end
