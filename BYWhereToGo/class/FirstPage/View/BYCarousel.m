//
//  BYCarousel.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYCarousel.h"

#define scrollWidth BYWIDTH

static long step = 0;

@interface BYCarousel()<UIScrollViewDelegate>
{
    UIPageControl *pageControl;
    CADisplayLink *timer;
    BOOL isDraging;
    NSInteger image_count;
    UIScrollView *scroll;
}

@end

@implementation BYCarousel

-(void)setImages_data:(NSArray *)images_data
{
    _images_data = images_data;
    [self makeCarouselWithImages:_images_data];
}

-(void)makeCarouselWithImages:(NSArray *)imagesName
{
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, self.frame.size.height)];
    scroll.delegate = self;
    image_count = imagesName.count;
    for (int i = 0; i<image_count; i++) {
        UIButton *imgButton = [[UIButton alloc] initWithFrame:CGRectMake(i * scrollWidth, 0, scrollWidth, scroll.frame.size.height)];
        CGImageRef image = [UIImage imageNamed:imagesName[i]].CGImage;
        [imgButton setBackgroundImage:[UIImage imageWithCGImage:image scale:2.0 orientation:UIImageOrientationUp] forState:0];
        [imgButton setBackgroundImage:[UIImage imageWithCGImage:image scale:2.0 orientation:UIImageOrientationUp] forState:1 << 0];
        
        [imgButton addTarget:self
                      action:@selector(btnClick)
            forControlEvents:1<<6];
        [scroll addSubview:imgButton];
    }
    
    scroll.contentSize = CGSizeMake(image_count * scrollWidth, self.frame.size.height);
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    [self addSubview:scroll];
    
    [self setupPageControlWithFatherview:self];

    timer = [CADisplayLink displayLinkWithTarget:self
                                        selector:@selector(update:)];
    [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


-(void)btnClick
{
    NSLog(@"1");
}

-(void)update:(CADisplayLink *)timer
{
    step++;
    if (step % 180 != 0 || isDraging) {
        return;
    }
    CGPoint offset = scroll.contentOffset;
    offset.x += scrollWidth;
    if (offset.x > scrollWidth * (image_count-1)) {
        offset.x = 0;
        [scroll setContentOffset:offset animated:NO];
        [self changePageWithPage:0];
        return;
    }
    NSInteger page = offset.x / scrollWidth;
    [scroll setContentOffset:offset animated:YES];
    [self changePageWithPage:page];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isDraging = YES;
    step = 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    isDraging = NO;
    CGPoint offset = scroll.contentOffset;
    NSInteger page = offset.x / scrollWidth;
    [self changePageWithPage:page];
}

- (void)changePageWithPage:(NSInteger)page
{
    pageControl.currentPage = page;
}

- (void)setupPageControlWithFatherview:(UIView *)fatherView
{
    pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = image_count;
    pageControl.center = CGPointMake(scrollWidth/2 , self.frame.size.height*0.85);
    pageControl.userInteractionEnabled = NO;
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:0.2];
    pageControl.currentPage = 0;
    [fatherView addSubview:pageControl];
}

@end
