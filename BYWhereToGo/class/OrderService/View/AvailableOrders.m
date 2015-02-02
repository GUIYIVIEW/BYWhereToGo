//
//  AvailableOrders.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AvailableOrders.h"

@implementation AvailableOrders

-(void)setServicePics:(NSArray *)servicePics
{
    _servicePics = servicePics;
    [self makeContentViewWithServicesPic:_servicePics];
}


-(void)makeContentViewWithServicesPic:(NSArray *)servicePics
{
    CGFloat self_width = self.frame.size.width;
    CGFloat service_btn_margin = (self_width - 50 * 5)/6;
    CGFloat max_height = 0;
    
    UIImageView *star_ticket = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self_width, 50)];
    star_ticket.layer.cornerRadius = 5;
    CGImageRef star_ticket_img = [UIImage imageNamed:@"special_price"].CGImage;
    star_ticket.image  = [UIImage imageWithCGImage:star_ticket_img  scale:2.0 orientation:UIImageOrientationUp];
    [self addSubview:star_ticket];
    
    UIView *services = [[UIView alloc] init];
    services.layer.cornerRadius = 5;
    services.backgroundColor = [UIColor whiteColor];
    
    UILabel *label_intro = [[UILabel alloc] initWithFrame:CGRectMake(service_btn_margin+2,18,self_width,20)];
    label_intro.text = @"为您提供便捷的订单管理, 请登录使用";
    label_intro.font = [UIFont systemFontOfSize:16];
    label_intro.textColor = [UIColor blackColor];
    [services addSubview:label_intro];
    
    for (int i = 0; i < servicePics.count; i++) {
        int row = i / 5;
        int column = i % 5;
        CGFloat button_position_y = 50 + (50 + service_btn_margin)*row;
        max_height = button_position_y;
        UIButton *button_service = [[UIButton alloc] initWithFrame:CGRectMake(service_btn_margin + (service_btn_margin+50)*column,button_position_y, 50, 50)];
        CGImageRef service_img = [UIImage imageNamed:servicePics[i]].CGImage;
        [button_service setBackgroundImage:[UIImage imageWithCGImage:service_img scale:2.0 orientation:UIImageOrientationUp] forState:0];
        [button_service setBackgroundImage:[UIImage imageWithCGImage:service_img scale:2.0 orientation:UIImageOrientationUp] forState:1<<0];
        [services addSubview:button_service];
    }
    
    UILabel *label_subIntro = [[UILabel alloc] initWithFrame:CGRectMake(service_btn_margin+2, max_height + 60, self_width, 20)];
    label_subIntro.text = [NSString stringWithFormat:@"暂时仅支持以上%d种业务",(int)servicePics.count];
    label_subIntro.font = [UIFont systemFontOfSize:13];
    label_subIntro.textColor = [UIColor grayColor];
    [services addSubview:label_subIntro];
    
    services.frame = CGRectMake(0, CGRectGetMaxY(star_ticket.frame)+10,self_width, CGRectGetMaxY(label_subIntro.frame)+20);
    [self addSubview:services];
    
    
    self.contentSize = CGSizeMake(self_width, BYHEIGHT);
    self.showsVerticalScrollIndicator = NO;
    
    UIView *service_reminder = [[UIView alloc] initWithFrame:CGRectMake(0, BYHEIGHT-250, self_width, 60)];
    
    CALayer *hit = [CALayer layer];
    hit.frame = CGRectMake(0, 20, self_width, 50);
    hit.backgroundColor = [UIColor clearColor].CGColor;
    hit.cornerRadius = 3;
    hit.borderColor = [UIColor whiteColor].CGColor;
    hit.borderWidth = 0.5;
    [service_reminder.layer addSublayer:hit];
    
    UILabel *hit_title = [[UILabel alloc] init];
    hit_title.center = CGPointMake(self_width/2, 20);
    hit_title.bounds = CGRectMake(0, 0, 150, 20);
    hit_title.text = @"服务提醒";
    hit_title.textAlignment = NSTextAlignmentCenter;
    hit_title.textColor = [UIColor whiteColor];
    hit_title.backgroundColor = blue_tabbar_title;
    hit_title.font = [UIFont systemFontOfSize:14];
    [service_reminder addSubview:hit_title];
    
    
    NSString *hit_text = @"为您提供了“在线服务”, 请登录后使用";
    NSMutableAttributedString *details_text = [[NSMutableAttributedString alloc] initWithString:hit_text];
    [details_text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14]
                         range:NSMakeRange(0, 19)];
    [details_text addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15]
                         range:NSMakeRange(6, 4)];

    UILabel *hit_details = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, service_reminder.frame.size.width-20, 14)];
    hit_details.attributedText = details_text;
    hit_details.textColor = [UIColor whiteColor];
    hit_details.backgroundColor = blue_tabbar_title;
    [service_reminder addSubview:hit_details];
    
    [self addSubview:service_reminder];
}

@end
