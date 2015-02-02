//
//  BYSpecialSelling.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYSpecialSelling.h"
#import "SpecialSellingModel.h"

@interface BYSpecialSelling()
{
    UILabel *time;
    NSDate *time_aim;
}
@end

@implementation BYSpecialSelling

-(void)setSP_model:(SpecialSellingModel *)SP_model
{
    _SP_model = SP_model;
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 3;
    self.layer.borderColor  = gray_discover_border.CGColor;
    self.layer.borderWidth  = 1;
    
    [self makeMainContentWithSPModel:SP_model];
}


-(void)makeMainContentWithSPModel:(SpecialSellingModel *)SP_model
{
    UILabel *title_main = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 40, 20)];
    title_main.font = [UIFont boldSystemFontOfSize:15];
    title_main.textAlignment = NSTextAlignmentLeft;
    title_main.text = @"特卖";
    [self addSubview:title_main];
    
    UIImageView *special_main = [[UIImageView alloc] initWithFrame:CGRectMake(0, 35, self.frame.size.width, 80)];
    CGImageRef special_img = [UIImage imageNamed:SP_model.SP_pic].CGImage;
    special_main.image = [UIImage imageWithCGImage:special_img scale:2.0 orientation:UIImageOrientationUp];
    [self addSubview:special_main];

    
    CGImageRef image = [UIImage imageNamed:@"count_down"].CGImage;
    UIImageView *hit_image = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:image scale:2.0 orientation:UIImageOrientationUp]];
    hit_image.frame = CGRectMake(self.frame.size.width-95 ,33 , 90, 100);
    [self addSubview:hit_image];
    
    
    UILabel *title_end = [[UILabel alloc] initWithFrame:CGRectMake(6, 8, 90, 15)];
    title_end.text = @"距离结束";
    title_end.font = [UIFont systemFontOfSize:13];
    title_end.textColor = [UIColor whiteColor];
    [hit_image addSubview:title_end];
    

    time = [[UILabel alloc] initWithFrame:CGRectMake(6.5, 30, 90, 15)];
    time.textColor = [UIColor orangeColor];
    time.font = [UIFont systemFontOfSize:13];
    [hit_image addSubview:time];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compo = [[NSDateComponents alloc] init];
    NSString *end_time = SP_model.SP_endTime;

    [compo setYear:[[end_time substringWithRange:NSMakeRange(0, 4)] intValue]];
    [compo setMonth:[[end_time substringWithRange:NSMakeRange(4, 2)] intValue]];
    [compo setDay:[[end_time substringWithRange:NSMakeRange(6, 2)] intValue]];
    [compo setHour:[[end_time substringWithRange:NSMakeRange(8, 2)] intValue]];
    [compo setMinute:[[end_time substringWithRange:NSMakeRange(10, 2)] intValue]];
    time_aim = [calendar dateFromComponents:compo];
    [self calculateRestTime];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(calculateRestTime)
                                                    userInfo:nil
                                                     repeats:YES];
    
    UILabel *cost = [[UILabel alloc] initWithFrame:CGRectMake(30, 55, 200, 25)];
    cost.text = SP_model.SP_price;
    cost.font = [UIFont boldSystemFontOfSize:20];
    cost.textColor = [UIColor whiteColor];
    [hit_image addSubview:cost];
    
    
    UILabel *title_self = [[UILabel alloc] initWithFrame:CGRectMake(8, 122, self.frame.size.width, 20)];
    title_self.text = SP_model.SP_title;
    title_self.font = [UIFont systemFontOfSize:15];
    title_self.textColor = gray_discover_title;
    [self addSubview:title_self];
    
    NSString *end_time2 = [NSString stringWithFormat:@"%@:%@准时抢",[end_time substringWithRange:NSMakeRange(8, 2)],[end_time substringWithRange:NSMakeRange(10, 2)]];
    UILabel *title_time = [[UILabel alloc] initWithFrame:CGRectMake(50, 9, 200, 20)];
    title_time.font = [UIFont systemFontOfSize:14];
    title_time.text = end_time2;
    title_time.textColor = [UIColor grayColor];
    title_time.textAlignment = NSTextAlignmentLeft;
    [self addSubview:title_time];
    
}

-(void)calculateRestTime
{
    NSDate *time_now = [NSDate date];
    
    int timeRest = [time_aim timeIntervalSinceDate:time_now];
    
    int hour = timeRest/3600;
    int hourNo1 = hour/10;
    int hourNo2 = hour%10;
    
    int minutes = (timeRest % 3600) / 60;
    int minuteNo1 = minutes/10;
    int minuteNo2 = minutes%10;
    
    int second = (timeRest % 3600) % 60;
    int secondNo1 = second/10;
    int secondNo2 = second%10;
    
    time.text = [NSString stringWithFormat:@"%d %d   %d %d   %d %d",hourNo1,hourNo2,minuteNo1,minuteNo2,secondNo1,secondNo2];
}
@end
