//
//  AllOrders.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AllOrders.h"


@interface AllOrders() <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *order_types;
@end

@implementation AllOrders

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        NSLog(@"%d",(int)self.contentSize.height);
        _order_types = @[@"机票订单",@"酒店订单",@"钟点房订单",@"团购订单",@"火车票订单",@"接送用车订单",@"门票订单",@"用车和自驾订单",@"身边订单",@"旅游度假/周末游订单",@"签证订单",@"当地人订单"];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return _order_types.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.contentSize = CGSizeMake(BYWIDTH-20, 810);
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"orders";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if (indexPath.section == 0) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
            CGImageRef img_cg = [UIImage imageNamed:@"special_price"].CGImage;
            img.image = [UIImage imageWithCGImage:img_cg scale:2.0 orientation:UIImageOrientationUp];
            cell.backgroundView = img;
        }
        else if (indexPath.section == 1)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = _order_types[indexPath.row];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 50;
    }
    return 8;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    if (section == 1) {
        NSString *hit = @"温馨提示 :";
        NSString *hit_1 = @"1.您还未登录, 登录后可将手机订单与网络订单同步";
        NSString *hit_2 = @"2.团购的订单需要登录后才能查看哦~";
        
        hit = [hit stringByAppendingFormat:@"\n%@",hit_1];
        hit = [hit stringByAppendingFormat:@"\n%@",hit_2];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BYWIDTH-20, 50)];
        
        UILabel *hit_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, BYWIDTH-20, 50)];
        hit_label.lineBreakMode = NSLineBreakByCharWrapping;
        hit_label.numberOfLines = 0;
        hit_label.font = [UIFont systemFontOfSize:10];
        hit_label.textColor =[UIColor grayColor];
        hit_label.text = hit;
        
        [view addSubview:hit_label];
        return view;
    }
    return nil;
}

@end
