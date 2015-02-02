//
//  BYFirstPageScrollerView.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYFirstPageScrollerView.h"
#import "BYCarouselDatas.h"
#import "BYCarousel.h"
#import "BYContentDetails.h"
#import "BYDetailsData.h"
#import "BYIconsView.h"
#import "BYFirstPageVC.h"

@interface BYFirstPageScrollerView() <BYIconsViewDelegate>

@end

@implementation BYFirstPageScrollerView

-(void)makeScrollerView
{
    [self makeTitleImage];
    
    [self makeContentDetails];
    
    self.contentSize = CGSizeMake(BYWIDTH,BYHEIGHT+12);
    self.contentInset = UIEdgeInsetsMake(-80, 0, 0, 0);
}

-(void)makeTitleImage
{
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BYWIDTH-200, 50)];
    image.center = CGPointMake(BYWIDTH/2, 50/2);
    image.image = [UIImage imageNamed:@"titleImage"];
    [self addSubview:image];
}

-(void)makeContentDetails
{
    NSArray *images = [BYCarouselDatas makeCarouselData];
    
    BYCarousel *carousel = [[BYCarousel alloc] initWithFrame:CGRectMake(0, 80, BYWIDTH, 130)];
    carousel.images_data = images;
    [self addSubview:carousel];
    
    BYIconsView *icons = [[BYIconsView alloc] initWithFrame:CGRectMake(BYWIDTH-95, 80, 95, 35)];
    [icons makeIcons];
    icons.delegate = self;
    [self addSubview:icons];
    
    NSArray *itemsData = [BYDetailsData makeDetailsData];
    BYContentDetails *content_details = [[BYContentDetails alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(carousel.frame), BYWIDTH, BYHEIGHT-130)];
    content_details.itemsdata = itemsData;
    [self addSubview:content_details];
}

-(void)setupCameraDele
{
    id next = [self nextResponder];
    while (![next isKindOfClass:[BYFirstPageVC class]]) {
        next = [next nextResponder];
    }
    if ([next isKindOfClass:[BYFirstPageVC class]]) {
        BYFirstPageVC *vc = (BYFirstPageVC *)next;
        [vc setupCameraDele];
    }
}


@end
