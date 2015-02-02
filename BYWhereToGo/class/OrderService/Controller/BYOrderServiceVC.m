//
//  BYOrderServiceVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYOrderServiceVC.h"
#import "UIBarButtonItem+MJ.h"
#import "AvailableOrders.h"
#import "AllOrders.h"

@interface BYOrderServiceVC ()
{
    AvailableOrders *orders;
    AllOrders *All_orders;
}
@end

@implementation BYOrderServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeSegment];
    
    UIBarButtonItem *login_item = [UIBarButtonItem itemWithTitle:@"登录" NormalColor:blue_order_navbar HighlightedColor:blue_order_navbar target:self action:@selector(loginNavBarClick)];
    self.navigationItem.rightBarButtonItem = login_item;
    
    orders = [[AvailableOrders alloc] initWithFrame:CGRectMake(10, 40, BYWIDTH-20, BYHEIGHT-40)];
    orders.servicePics = @[@"avi_order_item1",@"avi_order_item2",@"avi_order_item3",@"avi_order_item4",@"avi_order_item5"];
    orders.hidden = NO;
    [self.view addSubview:orders];
    
    All_orders = [[AllOrders alloc] initWithFrame:CGRectMake(0, 40, BYWIDTH, BYHEIGHT) style:UITableViewStyleGrouped];
    All_orders.backgroundColor = blue_discover_bg;
    All_orders.hidden = YES;
    [self.view addSubview:All_orders];
    
}

-(void)loginNavBarClick
{
    NSLog(@"1");
}

-(void)makeSegment
{
    NSArray *segement_items = @[@"可用订单",@"全部订单"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segement_items];
    segment.frame = CGRectMake(10, 0, BYWIDTH-20, 30);
    segment.selectedSegmentIndex = 0;
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14];
    attri[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segment setTitleTextAttributes:attri forState:0];
    
    NSMutableDictionary *attri_high = [NSMutableDictionary dictionary];
    attri_high[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14];
    attri_high[NSForegroundColorAttributeName] = blue_tabbar_title;
    [segment setTitleTextAttributes:attri_high forState:1<<2];
    
    NSMutableDictionary *attri_select = [NSMutableDictionary dictionary];
    attri_select[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14];
    attri_select[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segment setTitleTextAttributes:attri_select forState:1<<0];
    
    segment.layer.cornerRadius = 3;
    segment.layer.borderColor = [UIColor whiteColor].CGColor;
    segment.layer.borderWidth = 1;
    segment.clipsToBounds = YES;
    segment.tintColor = [UIColor whiteColor];
    
    [segment addTarget:self
                action:@selector(segementChooseItem:)
      forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
}

-(void)segementChooseItem:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 0) {
        orders.hidden = NO;
        All_orders.hidden = YES;
    }
    else if (seg.selectedSegmentIndex == 1)
    {
        orders.hidden = YES;
        All_orders.hidden = NO;
    }
}
@end
