//
//  BYIconsView.h
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYIconsViewDelegate <NSObject>

@optional
-(void)setupCameraDele;
-(void)setupEmailDele;
@end


@interface BYIconsView : UIView
@property (nonatomic,weak) id<BYIconsViewDelegate> delegate;
-(void)makeIcons;
@end
