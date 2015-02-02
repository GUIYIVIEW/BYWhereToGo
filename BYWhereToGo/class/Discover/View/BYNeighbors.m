//
//  BYNeighbors.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYNeighbors.h"
#import "CCLocationManager.h"
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

@interface BYNeighbors()
@property (nonatomic,strong) UILabel *location_label;

@end

@implementation BYNeighbors

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeNeighborThings];
    }
    return self;
}

-(void)makeNeighborThings
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 3;
    self.layer.borderColor  = gray_discover_border.CGColor;
    self.layer.borderWidth  = 1;
    
    [self makeMainContent];
    
    [self makeSubContent];
}

-(void)makeMainContent
{
    CALayer *location_layer = [CALayer layer];
    location_layer.frame = CGRectMake(8, 5, 16, 18);
    location_layer.opacity = 0.7;
    location_layer.contents = (id)[UIImage imageNamed:@"location"].CGImage;
    [self.layer addSublayer:location_layer];
    
    self.location_label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(location_layer.frame)+5, 8, 200, 14)];
    self.location_label.font = [UIFont systemFontOfSize:13];
    self.location_label.textColor = gray_discover_title;

    __weak typeof(self) weself = self;
    
    if (IS_IOS8) {
        [[CCLocationManager shareLocation] getAddress:^(NSString *addressString) {
             weself.location_label.text = addressString;
        }];
    }
    [self addSubview:self.location_label];
    
    NSArray *btn_Array = @[@"discover_hotel",@"discover_food",@"discover_enter",@"discover_place"];
    NSArray *label_Array = @[@"酒店",@"美食",@"娱乐",@"景点"];
    
    CGFloat btn_width = self.frame.size.width / 4;
    for (int i = 0; i<4; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btn_width*i, 25, btn_width, 50)];
        CGImageRef img = [UIImage imageNamed:btn_Array[i]].CGImage;
        [btn setImage:[UIImage imageWithCGImage:img scale:2.0 orientation:UIImageOrientationUp] forState:0];
        [btn setImage:[UIImage imageWithCGImage:img scale:2.0 orientation:UIImageOrientationUp] forState:1<<0];
        
        [self addSubview:btn];
    }
    
    for (int i = 0; i<4; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(btn_width * i, 70, btn_width, 30)];
        label.font = [UIFont systemFontOfSize:14];
        label.text = label_Array[i];
        label.textColor = gray_discover_title;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    
    CALayer *line = [CALayer layer];
    line.backgroundColor = gray_discover_border.CGColor;
    line.frame = CGRectMake(0, 100, self.frame.size.width, 1);
    [self.layer insertSublayer:line atIndex:0];
}


-(void)makeSubContent
{
    NSArray *recommend_Array = @[@"flight",@"spring"];
    for (int i = 0; i<2; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*(1+(self.frame.size.width-1)/2), 101, (self.frame.size.width-1)/2, 49)];
        CGImageRef img = [UIImage imageNamed:recommend_Array[i]].CGImage;
        [button setImage:[UIImage imageWithCGImage:img scale:2.0 orientation:UIImageOrientationUp] forState:0];
        
        [self addSubview:button];
    }
    
    CALayer *line_mid = [CALayer layer];
    line_mid.backgroundColor = gray_discover_border.CGColor;
    line_mid.frame = CGRectMake((self.frame.size.width-1)/2, 101, 1, 50);
    [self.layer insertSublayer:line_mid atIndex:0];
}

@end
