//
//  BYTabbar.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYTabbar.h"
#import "BYTabar_subBtn.h"
#import "BYTabbar_mainBtn.h"
#import "UIImage+MJM.h"
#import "BYTabbarVCDetails.h"
#import "ButtonStyle1.h"

@interface BYTabbar()
{
    UIButton  *sub1;
    UIButton  *sub2;
    UIButton  *center;
    CGRect  tabbar_bounds;
}
@property (nonatomic,weak) UIButton *select_btn;
@end

@implementation BYTabbar

-(void)setDetails:(NSArray *)details
{
    _details = details;
    [self makeTabBar];
}

-(void)makeTabBar
{
    tabbar_bounds = self.bounds;
    
    sub1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BYWIDTH/5, self.frame.size.height)];
    sub1.alpha = 0.95;
    sub1.backgroundColor = [UIColor whiteColor];
    CGImageRef sub1image = [UIImage imageNamed:@"tabbar_sub"].CGImage;
    [sub1 setBackgroundImage:[UIImage imageWithCGImage:sub1image scale:2.0 orientation:UIImageOrientationUp] forState:0];
    [sub1 setBackgroundImage:[UIImage imageWithCGImage:sub1image scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:sub1];

    center = [[UIButton alloc] initWithFrame:CGRectMake(BYWIDTH/5, tabbar_bounds.origin.y - 10,BYWIDTH/5*3,tabbar_bounds.size.height + 10)];
    center.backgroundColor = [UIColor whiteColor];
    center.alpha = 0.95;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:center.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight
                                                         cornerRadii:CGSizeMake(6,6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = center.bounds;
    maskLayer.path = maskPath.CGPath;
    center.layer.mask = maskLayer;
    center.clipsToBounds = YES;
    CGImageRef centerImage = [UIImage imageNamed:@"tabbar_center"].CGImage;
    [center setBackgroundImage:[UIImage imageWithCGImage:centerImage scale:2.0 orientation:UIImageOrientationUp] forState:0];
    [center setBackgroundImage:[UIImage imageWithCGImage:centerImage scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:center];
    
    sub2 = [[UIButton alloc] initWithFrame:CGRectMake(BYWIDTH/5*4, 0, BYWIDTH/5, self.frame.size.height)];
    sub2.alpha = 0.95;
    sub2.backgroundColor = [UIColor whiteColor];
    CGImageRef sub2image = [UIImage imageNamed:@"tabbar_sub"].CGImage;
    [sub2 setBackgroundImage:[UIImage imageWithCGImage:sub2image scale:2.0 orientation:UIImageOrientationUp] forState:0];
    [sub2 setBackgroundImage:[UIImage imageWithCGImage:sub2image scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:sub2];
    
    [self makeButtonsWithArray:self.details];
}



-(void)makeButtonsWithArray:(NSArray *)Array
{
    for (int i=0; i<Array.count; i++) {
        NSDictionary *dic = Array[i];
        NSString *title = [dic objectForKey:@"title"];
        NSString *pic = [dic objectForKey:@"pic"];
        NSString *selectPic = [dic objectForKey:@"selectPic"];
        UIButton *btn = [self makebtnWithTitle:title Pic:pic SelectPic:selectPic index:i];
        btn.tag = i;
        [btn addTarget:self
                action:@selector(buttonClick:)
      forControlEvents:1<<6];
        
        if (i == 0) {
            btn.frame = sub1.bounds;
            [sub1 addSubview:btn];
        }
        else if(i == 4) {
            btn.frame = sub2.bounds;
            [sub2 addSubview:btn];
        }
        else
        {
            btn.frame = CGRectMake((i-1) * BYWIDTH/5, 0, BYWIDTH/5, tabbar_bounds.size.height+10);
            if (i == 2) {
                btn.userInteractionEnabled = NO;
                [self buttonClick:btn];
            }
            if (i == 1) {
                CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
                anim.keyPath = @"opacity";
                anim.values = @[@(0.2),@(1.6),@(0.2)];
                anim.repeatCount = MAXFLOAT;
                anim.removedOnCompletion = NO;
                anim.fillMode = kCAFillModeForwards;
                anim.duration = 4;
                [btn.imageView.layer addAnimation:anim forKey:nil];
            }
            [center addSubview:btn];
        }
    }
}

-(void)buttonClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(didSelectButtonto:)]) {
        [self.delegate didSelectButtonto:(int)btn.tag];
    }
    self.select_btn.selected = NO;
    self.select_btn.userInteractionEnabled = YES;
    btn.selected = YES;
    self.select_btn = btn;
    self.select_btn.userInteractionEnabled = NO;
}

-(UIButton *)makebtnWithTitle:(NSString *)title Pic:(NSString *)pic SelectPic:(NSString *)selectPic index:(NSInteger)index
{
    UIButton *btn;
    if (index == 0 || index == 4) {
        btn = [[BYTabar_subBtn alloc] init];
    }
    else{
        btn = [[BYTabbar_mainBtn alloc] init];
    }
    
    [btn setTitle:title forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn setTitleColor:gray_tabbar_border forState:0];
    [btn setTitleColor:blue_tabbar_title forState:1<<2];
    
    CGImageRef Pic = [UIImage imageNamed:pic].CGImage;
    [btn setImage:[UIImage imageWithCGImage:Pic scale:2.0 orientation:UIImageOrientationUp] forState:0];
    [btn setImage:[UIImage imageWithCGImage:Pic scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
    CGImageRef SelPic = [UIImage imageNamed:selectPic].CGImage;
    [btn setImage:[UIImage imageWithCGImage:SelPic scale:2.0 orientation:UIImageOrientationUp] forState:1 << 2];
    
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.imageView.contentMode    = UIViewContentModeCenter;
    
    return btn;
}


@end
