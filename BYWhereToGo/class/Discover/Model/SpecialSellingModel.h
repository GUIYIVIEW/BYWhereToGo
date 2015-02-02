//
//  SpecialSellingModel.h
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialSellingModel : NSObject


@property (nonatomic,copy) NSString *SP_title;

@property (nonatomic,copy) NSString *SP_price;

@property (nonatomic,copy) NSString *SP_endTime;

@property (nonatomic,copy) NSString *SP_pic;


-(void)setupModelPropertiesWithSP_title:(NSString *)sp_title SP_price:(NSString *)sp_price SP_endtime:(NSString *)sp_endtime SP_pic:(NSString *)sp_pic;

@end
