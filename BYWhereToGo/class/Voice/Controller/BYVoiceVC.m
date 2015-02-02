//
//  BYVoiceVC.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/1/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYVoiceVC.h"
#import "Mp3Recorder.h"

@interface BYVoiceVC () <Mp3RecorderDelegate>
{
    Mp3Recorder *Recorder;
    NSTimer *recordTimer;
    NSInteger recordTime;
}

@end

@implementation BYVoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Recorder = [[Mp3Recorder alloc] initWithDelegate:self];
    
    UIButton *record = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    record.layer.cornerRadius = 100/2;
    record.clipsToBounds = YES;
    record.layer.borderWidth = 0.5;
    record.layer.borderColor = [UIColor redColor].CGColor;
    record.backgroundColor = [UIColor whiteColor];
    
    [record setTitle:@"按住以说话" forState:0];
    [record setTitle:@"松开以结束" forState:1<<0];
    [record setTitleColor:[UIColor blackColor] forState:0];
    
    [record addTarget:self
               action:@selector(beginRecord) forControlEvents:UIControlEventTouchDown];
    
    [record addTarget:self
               action:@selector(endRecord) forControlEvents:UIControlEventTouchUpInside];
    
    [record addTarget:self
               action:@selector(cancelRecord) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchCancel];
    
    
    [self.view addSubview:record];
    
    
}


-(void)beginRecord
{
    NSLog(@"1");
    [Recorder startRecord];
    recordTime = 0;
    recordTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countVoiceTime) userInfo:nil repeats:YES];
}

-(void)endRecord
{
    NSLog(@"2");
    if (recordTimer) {
        [Recorder stopRecord];
        [recordTimer invalidate];
        recordTimer = nil;
    }
}

-(void)cancelRecord
{
    if (recordTimer) {
        [Recorder cancelRecord];
        [recordTimer invalidate];
        recordTimer = nil;
    }
}

- (void)countVoiceTime
{
    recordTime ++;
    if (recordTime>=120) {
        [self endRecord];
    }
}


@end
