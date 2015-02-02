//
//  BYDiscoverVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYDiscoverVC.h"
#import "BYNeighbors.h"
#import "BYSpecialSelling.h"
#import "SpecialSellingModel.h"

@interface BYDiscoverVC ()

@end

@implementation BYDiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYNeighbors *neighbors = [[BYNeighbors alloc] initWithFrame:CGRectMake(10, 10, BYWIDTH-20, 150)];
    [self.view addSubview:neighbors];
    
    BYSpecialSelling *specialSelling = [[BYSpecialSelling alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(neighbors.frame)+10, BYWIDTH-20, 150)];
    SpecialSellingModel *SP_model = [[SpecialSellingModel alloc] init];
    [SP_model setupModelPropertiesWithSP_title:@"杭州-巴厘岛往返机票+当地一日游"
                                      SP_price:@"1999"
                                    SP_endtime:@"201502031300"
                                        SP_pic:@"specialSelling"];
    specialSelling.SP_model = SP_model;
    [self.view addSubview:specialSelling];
}

@end
