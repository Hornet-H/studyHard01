//
//  HFRelativeTimeController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/12.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRelativeTimeController.h"

@interface HFRelativeTimeController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeOffSetLabel;

@property (weak, nonatomic) IBOutlet UISlider *timeOffSetSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) UIBezierPath *bezierPath;
@property (strong, nonatomic) CALayer *shipLayer;

@end

@implementation HFRelativeTimeController

- (instancetype)init{
    HFRelativeTimeController *CancelAnimationVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CancelAnimationVC = (HFRelativeTimeController *)[HFRelativeTimeController initStoryBoard];
    }
    return CancelAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"RelativeTime" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFRelativeTimeController"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.bezierPath = [UIBezierPath bezierPath];
    [self.bezierPath moveToPoint:CGPointMake(300, 150)];
    [self.bezierPath addCurveToPoint:CGPointMake(0, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    
    self.shipLayer= [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 64, 64);
    self.shipLayer.position = CGPointMake(300, 150);
    self.shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:self.shipLayer];
}


- (IBAction)playClick:(UIButton *)sender {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    keyframeAnimation.keyPath = @"position";
    keyframeAnimation.timeOffset = self.timeOffSetSlider.value;
    keyframeAnimation.speed = self.speedSlider.value;
    keyframeAnimation.duration = 3.0;
    keyframeAnimation.path = self.bezierPath.CGPath;
    keyframeAnimation.repeatDuration = INFINITY;
    keyframeAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    keyframeAnimation.removedOnCompletion = NO;
    //填充模式
//    keyframeAnimation.fillMode = kCAFillModeBoth;
    keyframeAnimation.autoreverses = YES;
    [self.shipLayer addAnimation:keyframeAnimation forKey:@"slider"];
    [self updateSliders];
    
    //beginTime---动画开始之前的延迟时间，timeOffSet是让动画快进到某一个时间点
}

- (IBAction)updateSliders {
    CFTimeInterval timeoffSet = self.timeOffSetSlider.value;
    self.timeOffSetLabel.text = [NSString stringWithFormat:@"%0.2f",timeoffSet];
    float speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%0.2f",speed];
    
    
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
