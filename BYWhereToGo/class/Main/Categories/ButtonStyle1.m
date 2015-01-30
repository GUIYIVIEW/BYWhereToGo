//
//  ButtonStyle1.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ButtonStyle1.h"

@interface ButtonStyle1()
{
    CGFloat _distanceFromTopBorder;
    CGFloat _imageHeight;
    CGFloat _distanceBetweenImageAndTitle;
    
    UIColor *_normalTitleColor;
    UIColor *_selectTitleColor;
    CGFloat _zoomScale;
    NSInteger _font;

}

@end

@implementation ButtonStyle1


-(ButtonStyle1 *)makeStyle1ButtonWithTitle:(NSString *)title
                                 NormalPic:(NSString *)normalPic
                                 SelectPic:(NSString *)selectPic
                                     frame:(CGRect)frame
{
    ButtonStyle1 *button = [[ButtonStyle1 alloc] initWithFrame:frame];
    
    CGImageRef normal = [UIImage imageNamed:normalPic].CGImage;
    [button setImage:[UIImage imageWithCGImage:normal scale:_zoomScale orientation:UIImageOrientationUp] forState:0];
    [button setImage:[UIImage imageWithCGImage:normal scale:_zoomScale orientation:UIImageOrientationUp] forState:1<<0];
    
    CGImageRef select = [UIImage imageNamed:selectPic].CGImage;
    [button setImage:[UIImage imageWithCGImage:select scale:_zoomScale orientation:UIImageOrientationUp] forState:1<<2];
    
    [button setTitle:title forState:0];
    [button setTitleColor:_normalTitleColor forState:0];
    [button setTitleColor:_selectTitleColor forState:1<<2];
    
    button.titleLabel.font = [UIFont systemFontOfSize:_font];
    
    return button;
}


-(void)makeStyle1PropertiesOfFont:(CGFloat)font
                          NormalTitleColor:(UIColor *)normalTitleColor
                          SelectTitleColor:(UIColor *)selectTitleColor
                                 ZoomScale:(CGFloat)zoomScale
                     DistanceFromTopBorder:(CGFloat)distanceFromTopBorder
                               ImageHeight:(CGFloat)imageHeight
              DistanceBetweenImageAndTitle:(CGFloat)distanceBetweenImageAndTitle
{
    
    _distanceFromTopBorder = distanceFromTopBorder;
    _imageHeight = imageHeight;
    _distanceBetweenImageAndTitle = distanceBetweenImageAndTitle;
    _normalTitleColor = normalTitleColor;
    _selectTitleColor = selectTitleColor;
    _zoomScale = zoomScale;
    _font = font;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, _distanceFromTopBorder, contentRect.size.width, _imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat title_y = _distanceFromTopBorder+_imageHeight+_distanceBetweenImageAndTitle;
    return CGRectMake(0, title_y, contentRect.size.width, contentRect.size.height - title_y);
}

@end
