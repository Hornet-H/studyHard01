//
//  HFkeyFrameAnimationCGPathController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/7.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFkeyFrameAnimationCGPathController.h"

@interface HFkeyFrameAnimationCGPathController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HFkeyFrameAnimationCGPathController


- (instancetype)init{
    HFkeyFrameAnimationCGPathController *CGPathVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CGPathVC = (HFkeyFrameAnimationCGPathController *)[HFkeyFrameAnimationCGPathController initStoryBoard];
    }
    return CGPathVC;
}

+(UIViewController *)initStoryBoard{

    
    return [[UIStoryboard storyboardWithName:@"keyFrameAnimationCGPath" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFkeyFrameAnimationCGPathController"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
   /** 创建路径*/
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(300, 150)];
    [bezierPath addCurveToPoint:CGPointMake(0, 150) controlPoint1:CGPointMake(225, 300) controlPoint2:CGPointMake(75, 0)];
    /** 绘制路径*/
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    
    /** 创建飞船图层*/
    CALayer*shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(300, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"飞机"].CGImage;
    shipLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.containerView.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 5.0;
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    [shipLayer addAnimation:animation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
