//
//  BYTabbar.h
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYTabbar;

@protocol BYTabbarDelegate <NSObject>

@optional
- (void)didSelectButtonto:(int)to;

@end

@interface BYTabbar : UIView
@property (nonatomic,weak) id<BYTabbarDelegate> delegate;
@property (nonatomic,strong) NSArray *details;
@end
