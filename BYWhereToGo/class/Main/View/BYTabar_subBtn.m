//
//  BYTabar_subBtn.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYTabar_subBtn.h"
#import "UIImage+MJM.h"

@implementation BYTabar_subBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 5, contentRect.size.width, contentRect.size.height-23);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height-18, contentRect.size.width, 15);
}

@end
