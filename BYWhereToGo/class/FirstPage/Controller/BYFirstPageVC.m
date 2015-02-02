//
//  BYFirstPageVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYFirstPageVC.h"
#import "BYFirstPageScrollerView.h"
#import <AVFoundation/AVFoundation.h>
#import "BYScanVC.h"
#import "BYEmailVC.h"

@interface BYFirstPageVC ()
{
    BOOL ifhasTabbar;
}
@end

@implementation BYFirstPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    
    BYFirstPageScrollerView *firstpage_content = [[BYFirstPageScrollerView alloc] initWithFrame:CGRectMake(0, -BYHEIGHT, BYWIDTH, BYHEIGHT)];
    [firstpage_content makeScrollerView];
    [self.view addSubview:firstpage_content];
    
//    [UIView animateWithDuration:1.5
//                     animations:^{
//                         firstpage_content.frame = CGRectMake(0, 70, BYWIDTH, BYHEIGHT);
//                     }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.3
//                         animations:^{
                             firstpage_content.frame = CGRectMake(0, 0, BYWIDTH, BYHEIGHT);
//                         }];
//    });
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabBarController.tabBar setHidden:NO];
//    });
}


-(void)setupCameraDele
{
    BYScanVC *scanVC = [[BYScanVC alloc] init];
    [self.navigationController pushViewController:scanVC animated:YES];
}

-(void)setupEmailDele
{
    BYEmailVC *emailVC = [[BYEmailVC alloc] init];
    [self.navigationController pushViewController:emailVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
//    if (!ifhasTabbar == 1) {
//        ifhasTabbar = 1;
//        [self.tabBarController.tabBar setHidden:YES];
//    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
@end
