//
//  BYIconsView.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYIconsView.h"
#import "UIView+MJM.h"
#import "BYScanVC.h"

@interface BYIconsView() 

@end

@implementation BYIconsView

-(void)makeIcons
{
    UIView *bg_view = [[UIView alloc] initWithFrame:self.bounds];
    bg_view.backgroundColor = [UIColor blackColor];
    bg_view.alpha = 0.4;
    [self addSubview:bg_view];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bg_view.bounds
                                                   byRoundingCorners:UIRectCornerBottomLeft
                                                         cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = bg_view.bounds;
    maskLayer.path = maskPath.CGPath;
    bg_view.layer.mask = maskLayer;
    bg_view.clipsToBounds = YES;

    // 47 * 35
    //scan
    UIButton *scan = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width-1)/2, self.frame.size.height)];
    [scan addTarget:self
             action:@selector(setupCamera)
   forControlEvents:1<<6];
    CGImageRef scan_image = [UIImage imageNamed:@"scan"].CGImage;
    [scan setImage:[UIImage imageWithCGImage:scan_image scale:3.3 orientation:UIImageOrientationUp] forState:0];
    [scan setImage:[UIImage imageWithCGImage:scan_image scale:3.3 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:scan];
    
    //line
    UIView *line = [UIView makeLinesWithFrame:CGRectMake(scan.frame.size.width, 8, 1, 19) lineColor:[UIColor whiteColor] fatherView:self];
    
    //mail
    UIButton *mail = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line.frame), 0, (self.frame.size.width-1)/2, self.frame.size.height)];
    CGImageRef mail_image = [UIImage imageNamed:@"mail"].CGImage;
    [mail setImage:[UIImage imageWithCGImage:mail_image scale:3.3 orientation:UIImageOrientationUp] forState:0];
    [mail setImage:[UIImage imageWithCGImage:mail_image scale:3.3 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:mail];
}

- (void)setupCamera
{
    if ([self.delegate respondsToSelector:@selector(setupCameraDele)]) {
        [self.delegate setupCameraDele];
    }
}





@end
