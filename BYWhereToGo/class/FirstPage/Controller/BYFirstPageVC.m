//
//  BYFirstPageVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYFirstPageVC.h"
#import "BYFirstPageScrollerView.h"

@interface BYFirstPageVC ()

@end

@implementation BYFirstPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYFirstPageScrollerView *firstpage_content = [[BYFirstPageScrollerView alloc] initWithFrame:CGRectMake(0, 0, BYWIDTH, BYHEIGHT)];
    [firstpage_content makeScrollerView];
    [self.view addSubview:firstpage_content];
}
@end
