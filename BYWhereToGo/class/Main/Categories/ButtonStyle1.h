//
//  ButtonStyle1.h
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonStyle1 : UIButton

-(void)makeStyle1PropertiesOfFont:(CGFloat)font
                 NormalTitleColor:(UIColor *)normalTitleColor
                 SelectTitleColor:(UIColor *)selectTitleColor
                        ZoomScale:(CGFloat)zoomScale
            DistanceFromTopBorder:(CGFloat)distanceFromTopBorder
                      ImageHeight:(CGFloat)imageHeight
     DistanceBetweenImageAndTitle:(CGFloat)distanceBetweenImageAndTitle;

-(ButtonStyle1 *)makeStyle1ButtonWithTitle:(NSString *)title
                                 NormalPic:(NSString *)normalPic
                                 SelectPic:(NSString *)selectPic
                                     frame:(CGRect)frame;
@end
