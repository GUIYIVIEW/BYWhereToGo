//
//  BYTabbarVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYTabbarVC.h"
#import "BYTabbar.h"
#import "BYBaseNavVC.h"

#import "BYOrderServiceVC.h"
#import "BYVoiceVC.h"
#import "BYFirstPageVC.h"
#import "BYDiscoverVC.h"
#import "BYMineVC.h"

#import "BYTabbarVCDetails.h"

@interface BYTabbarVC () <BYTabbarDelegate>

@end

@implementation BYTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYOrderServiceVC *orderService = [[BYOrderServiceVC alloc] init];
    orderService.title = @"订单管理";
    orderService.view.backgroundColor = [UIColor whiteColor];
    BYBaseNavVC *orderServiceNav = [[BYBaseNavVC alloc] initWithRootViewController:orderService];

    BYVoiceVC *voice = [[BYVoiceVC alloc] init];
    voice.title = @"语音";
    voice.view.backgroundColor = [UIColor whiteColor];
    BYBaseNavVC *voiceNav = [[BYBaseNavVC alloc] initWithRootViewController:voice];
    
    BYFirstPageVC *firstPage = [[BYFirstPageVC alloc] init];
    firstPage.view.backgroundColor = [UIColor whiteColor];
    BYBaseNavVC *firstPageNav = [[BYBaseNavVC alloc] initWithRootViewController:firstPage];
    firstPageNav.navigationBarHidden = YES;
    
    BYDiscoverVC *discover = [[BYDiscoverVC alloc] init];
    discover.title = @"发现";
    discover.view.backgroundColor = [UIColor whiteColor];
    BYBaseNavVC *discoverNav = [[BYBaseNavVC alloc] initWithRootViewController:discover];
    
    BYMineVC *mine = [[BYMineVC alloc] init];
    mine.title = @"我的";
    mine.view.backgroundColor = [UIColor whiteColor];
    BYBaseNavVC *mineNav = [[BYBaseNavVC alloc] initWithRootViewController:mine];
    
    self.viewControllers = [NSArray arrayWithObjects:orderServiceNav,voiceNav,firstPageNav,discoverNav,mineNav, nil];

    BYTabbar *tabBar = [[BYTabbar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.details = [BYTabbarVCDetails makeTabbarVCDetails];
    tabBar.delegate = self;

//    [self.tabBar setTranslucent:YES];
    [self.tabBar addSubview:tabBar];
    self.selectedIndex = 2;
}

- (void)didSelectButtonto:(int)to
{
    self.selectedIndex = to;
}


@end
