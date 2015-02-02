//
//  SpecialSellingModel.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SpecialSellingModel.h"

@implementation SpecialSellingModel


-(void)setupModelPropertiesWithSP_title:(NSString *)sp_title SP_price:(NSString *)sp_price SP_endtime:(NSString *)sp_endtime SP_pic:(NSString *)sp_pic
{
    _SP_title = sp_title;
    _SP_price = sp_price;
    _SP_endTime = sp_endtime;
    _SP_pic = sp_pic;
}

@end
