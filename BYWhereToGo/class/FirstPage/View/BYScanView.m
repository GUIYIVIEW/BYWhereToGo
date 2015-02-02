//
//  BYScanView.m
//  BYWhereToGo
//
//  Created by bassamyan on 15/2/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BYScanView.h"
#import <AVFoundation/AVFoundation.h>

@interface BYScanView ()<AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate>
{
    CALayer *scan_line;
    CGFloat _rect_height;
}
@property (strong,nonatomic)AVCaptureDevice *device;
@property (strong,nonatomic)AVCaptureDeviceInput *input;
@property (strong,nonatomic)AVCaptureMetadataOutput *output;
@property (strong,nonatomic)AVCaptureSession *session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer *preview;
@end

@implementation BYScanView

-(void)makeScanerWithAimRectFactor:(CGRect)AimRect hitMessage:(NSString *)hitMessage backgroundAlpha:(CGFloat)alpha
{
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    self.output = [[AVCaptureMetadataOutput alloc]init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([self.session canAddInput:self.input]){
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output]){
        [self.session addOutput:self.output];
    }
    self.output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    self.output.rectOfInterest = AimRect;
    
    self.preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity =AVLayerVideoGravityResizeAspectFill;
    self.preview.frame =CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
    [self.layer addSublayer:self.preview];
    [self.session startRunning];
    
    CGFloat rect_width = AimRect.size.width * BYWIDTH;
    CGFloat rect_height = rect_width;
    CGFloat rect_originX = AimRect.origin.y * BYWIDTH;
    CGFloat rect_originY = AimRect.origin.x * BYHEIGHT;
    _rect_height = rect_height;
    
    //周边阴影框框
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = [UIColor blackColor].CGColor;
    layer1.opacity = alpha;
    layer1.frame = CGRectMake(0, 0, BYWIDTH,rect_originY);
    [self.layer addSublayer:layer1];
    
    CALayer *layer2 = [CALayer layer];
    layer2.backgroundColor = [UIColor blackColor].CGColor;
    layer2.opacity = alpha;
    layer2.frame = CGRectMake(0,rect_originY,rect_originX,rect_height);
    [self.layer addSublayer:layer2];
    
    CALayer *layer3 = [CALayer layer];
    layer3.backgroundColor = [UIColor blackColor].CGColor;
    layer3.opacity = alpha;
    layer3.frame = CGRectMake(rect_width+rect_originX,rect_originY,rect_originX,rect_height);
    [self.layer addSublayer:layer3];
    
    CALayer *layer4 = [CALayer layer];
    layer4.backgroundColor = [UIColor blackColor].CGColor;
    layer4.opacity = alpha;
    layer4.frame = CGRectMake(0,rect_originY+rect_height,BYWIDTH,BYHEIGHT-(rect_originY+rect_height));
    [self.layer addSublayer:layer4];
    
    UIImageView *scan_rect = [[UIImageView alloc] initWithFrame:CGRectMake(rect_originX-10, rect_originY-10, rect_width+20, rect_height+20)];
    CGImageRef img = [UIImage imageNamed:@"scan_rect"].CGImage;
    scan_rect.image = [UIImage imageWithCGImage:img scale:2.0 orientation:UIImageOrientationUp];
    [self addSubview:scan_rect];
    
    UILabel *scan_hit = [[UILabel alloc] initWithFrame:CGRectMake(rect_originX,rect_originY+rect_height+30,rect_width, 15)];
    scan_hit.text = hitMessage;
    scan_hit.font = [UIFont systemFontOfSize:15];
    scan_hit.textColor = [UIColor whiteColor];
    scan_hit.textAlignment = NSTextAlignmentCenter;
    [self addSubview:scan_hit];
    
    scan_line = [CALayer layer];
    scan_line.frame = CGRectMake(rect_originX,rect_originY,rect_width, 3);
    scan_line.backgroundColor = blue_order_main.CGColor;
    [self.layer addSublayer:scan_line];
    [self addAnimationWithView:scan_line rectHeight:rect_height];

}

-(void)addAnimationWithView:(CALayer *)view rectHeight:(CGFloat)rectHeight
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.translation.y";
    anim.values = @[@(0),@(rectHeight-3),@(0)];
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 4;
    [view addAnimation:anim forKey:nil];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count] >0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    [_session stopRunning];
    [scan_line removeAllAnimations];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@""
                                                   message:stringValue
                                                  delegate:self
                                         cancelButtonTitle:@"重新扫描"
                                         otherButtonTitles:@"转至链接",nil];
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSURL* url = [[ NSURL alloc ] initWithString :alertView.message];
        [[UIApplication sharedApplication ] openURL:url];
    }
    else if (buttonIndex == 0)
    {
        [self addAnimationWithView:scan_line rectHeight:_rect_height];
        [self.session startRunning];
    }
}

@end
