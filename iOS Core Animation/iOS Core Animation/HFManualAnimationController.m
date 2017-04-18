//
//  HFManualAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFManualAnimationController.h"

@interface HFManualAnimationController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) CALayer *doorLayer;


@end

@implementation HFManualAnimationController
- (instancetype)init{
    HFManualAnimationController *ManualAnimationVC = nil;
    if (self = [super init]) {
        //        NSString *class = NSStringFromClass([self class]);
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        ManualAnimationVC = (HFManualAnimationController *)[HFManualAnimationController initStoryBoard];
        
    }
    
    return ManualAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"ManualAnimation" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFManualAnimationController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500;
    self.containerView.layer.transform = perspective;
    self.containerView.layer.backgroundColor = [UIColor colorWithRed:0.87 green:0.92 blue:0.93 alpha:1.00].CGColor;

    self.doorLayer = [CALayer layer];
        self.doorLayer.frame = CGRectMake(0, 0, 128, 256);
    self.doorLayer.position = CGPointMake(150 - 64, 150);
    self.doorLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"01"].CGImage);
    self.doorLayer.anchorPoint = CGPointMake(0, 0.5);
    self.doorLayer.speed = 0.0;
    [self.containerView.layer addSublayer:self.doorLayer];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]init];
    [pan addTarget:self action:@selector(pan:)];
    [self.containerView addGestureRecognizer:pan];
    
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform.rotation.y";
    basicAnimation.toValue = @(-M_PI_2);
    basicAnimation.duration = 1.0;
    [self.doorLayer addAnimation:basicAnimation forKey:nil];

}
- (void)pan:(UIPanGestureRecognizer *)pan{
    //转化后为单独的数值事实就是数学上的△t
    CGFloat x = [pan translationInView:self.view].x;
    NSLog(@"--%f---:",x);
    //使用一个合理的比例因子,将点转换成动画持续时间
    x /= 200.0f;
    //update timeOffset and clamp result
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.doorLayer.timeOffset = timeOffset;
    //reset pan gesture
    [pan setTranslation:CGPointZero inView:self.view];

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
