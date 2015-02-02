//
//  BYBaseNavVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYBaseNavVC.h"

@interface BYBaseNavVC ()

@end

@implementation BYBaseNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"color_main"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = attri;
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
//    self.hidesBarsOnTap = YES;
}


@end
