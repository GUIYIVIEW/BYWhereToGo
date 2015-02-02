//
//  BYScanVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYScanVC.h"
#import "BYScanView.h"


@implementation BYScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";

    BYScanView *scan_view = [[BYScanView alloc] initWithFrame:self.view.bounds];
    [scan_view makeScanerWithAimRectFactor:CGRectMake(((BYHEIGHT -BYWIDTH*0.6)/2-50)/BYHEIGHT,0.2,0.6,0.6)
                           hitMessage:@"将二维码放入框内,即可自动扫描"
                           backgroundAlpha:0.7];
    [self.view addSubview:scan_view];
}



-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"color_main"] forBarMetrics:UIBarMetricsDefault];
    self.hidesBottomBarWhenPushed = NO;
}

@end
