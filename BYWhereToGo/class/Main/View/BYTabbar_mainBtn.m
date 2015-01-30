//
//  BYTabbar_mainBtn.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYTabbar_mainBtn.h"
#import "UIImage+MJM.h"

@implementation BYTabbar_mainBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 8, contentRect.size.width, contentRect.size.height-28);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height-18, contentRect.size.width, 15);
}

@end
