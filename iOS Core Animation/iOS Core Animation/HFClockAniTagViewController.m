//
//  HFClockAniTagViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/7.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFClockAniTagViewController.h"

@interface HFClockAniTagViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *hourHand;
@property (weak, nonatomic) IBOutlet UIImageView *minuteHand;
@property (weak, nonatomic) IBOutlet UIImageView *secondHand;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation HFClockAniTagViewController
-(instancetype)init{
    HFClockAniTagViewController * presentationLayerVC = nil;
    if (self = [super init]) {
        
        presentationLayerVC  = [HFClockAniTagViewController initStoryBoard];
    }
    return presentationLayerVC;
    
}

+ (HFClockAniTagViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"Clock" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFClockAniTagViewController"];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.8f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.8f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.8f);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self updateHandsAnimated:NO];
    
}
- (void)tick{
    [self updateHandsAnimated:YES];


}
- (void)updateHandsAnimated:(BOOL)animated
{
    //获取或累的日历对象---其实是确定时区
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    //确定时间的组成--包括时分秒
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //从当前日历中获取想要的NSDateComponents对象
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    //计算时针当前所在的角度
    CGFloat hourAngle = (components.hour / 12.0) * M_PI * 2.0;
    //计算分针当前所在的角度
    CGFloat minuteAngle = (components.minute / 60.0) * M_PI * 2.0;
    //计算秒针当前所在的角度
    CGFloat secondAngle = (components.second / 60.0) * M_PI * 2.0;
    //
    [self setAngle:hourAngle forHand:self.hourHand animated:animated];
    [self setAngle:minuteAngle forHand:self.minuteHand animated:animated];
    [self setAngle:secondAngle forHand:self.secondHand animated:animated];
}



//- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated
//{
//    //generate transform
//    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
//    if (animated) {
//        //create transform animation
//        CABasicAnimation *animation = [CABasicAnimation animation];
//        [self updateHandsAnimated:NO];
//        animation.keyPath = @"transform";
//        animation.toValue = [NSValue valueWithCATransform3D:transform];
//        animation.duration = 0.5;
//        animation.delegate = self;
//        [animation setValue:handView forKey:@"handView"];
//        [handView.layer addAnimation:animation forKey:nil];
//    } else {
//        //set transform directly
//        handView.layer.transform = transform;
//    }
//}

- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated{
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    if (animated) {
        
        CABasicAnimation *animation = [CABasicAnimation animation];
        [self updateHandsAnimated:NO];
        animation.keyPath = @"transform";
        //添加----
        animation.fromValue = [handView.layer.presentationLayer valueForKey:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.duration = 0.5;
        animation.delegate = self;
        //添加
        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];

        [animation setValue:handView forKey:@"handView"];
        handView.layer.transform = transform;
        [handView.layer addAnimation:animation forKey:nil];
    }else{
        handView.layer.transform = transform;
    
    }



}


- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    //set final position for hand view
    UIView *handView = [anim valueForKey:@"handView"];
    handView.layer.transform = [anim.toValue CATransform3DValue];
    
}
    - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
