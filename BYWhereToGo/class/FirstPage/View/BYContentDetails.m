//
//  BYContentDetails.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYContentDetails.h"

#define distanceBetweenRows 5

@interface BYContentDetails()
{
    NSInteger index;
}

@end

@implementation BYContentDetails

-(void)setItemsdata:(NSArray *)itemsdata
{
    _itemsdata = itemsdata;
    [self makeContentDetailsWithData:_itemsdata];
}

-(void)makeContentDetailsWithData:(NSArray *)itemsdata
{
    
    CGFloat max_height = distanceBetweenRows;
    index = 0;
    
    CGFloat first_width = (BYWIDTH  - 5 * distanceBetweenRows)/4;
    CGFloat second_width = (BYWIDTH  - 3 * distanceBetweenRows)/2;
    
    CGFloat first_height = 50;
    CGFloat second_height = 120;
    
    //first row
    for (int i = 0; i<4; i++) {
        [self makeDetailsButtonWithFrame:CGRectMake(distanceBetweenRows + (distanceBetweenRows + first_width) * i, max_height, first_width, first_height)];
    }
    max_height += first_height + distanceBetweenRows;
    
    //second row
    for (int i = 0; i<2; i++) {
        [self makeDetailsButtonWithFrame:CGRectMake(distanceBetweenRows + (distanceBetweenRows + second_width) * i, max_height, second_width, second_height)];
    }
    max_height += second_height + distanceBetweenRows;
    
    //others
    for (int i = 0; i<10; i++) {
        NSInteger row = i / 2;
        NSInteger column = i % 2;
        [self makeDetailsButtonWithFrame:CGRectMake(distanceBetweenRows + (distanceBetweenRows + second_width)*column, max_height + (distanceBetweenRows + first_height)*row, second_width, first_height)];
    }
    
}

-(void)makeDetailsButtonWithFrame:(CGRect)frame
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    CGImageRef image = [UIImage imageNamed:_itemsdata[index]].CGImage;
    [button setBackgroundImage:[UIImage imageWithCGImage:image scale:2.0 orientation:UIImageOrientationUp] forState:0];
    [button setBackgroundImage:[UIImage imageWithCGImage:image scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
    [self addSubview:button];
    index ++ ;
}

@end
