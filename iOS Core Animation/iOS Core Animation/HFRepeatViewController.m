//
//  HFRepeatViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/12.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRepeatViewController.h"

@interface HFRepeatViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HFRepeatViewController

- (instancetype)init{
    HFRepeatViewController *mediaTimingVC = nil;
    if (self = [super init]) {
        //        NSString *class = NSStringFromClass([self class]);
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        mediaTimingVC = (HFRepeatViewController *)[HFRepeatViewController initStoryBoard];
        
    }
    
    return mediaTimingVC;
}

+ (UIViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"Repeat" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFRepeatViewController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView.backgroundColor = [UIColor colorWithRed:0.87 green:0.91 blue:0.93 alpha:1.00];
    CALayer *doorlayer = [CALayer layer];
    doorlayer.frame = CGRectMake(0, 0, 128, 256);
    doorlayer.position = CGPointMake(150 - 64, 150);
    doorlayer.anchorPoint = CGPointMake(0, 0.5);
    doorlayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"01"].CGImage);
    [self.containerView.layer addSublayer:doorlayer];
    
    //给弗雷图层设置灭点，则子图层就有了相同的灭点
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500;
    self.containerView.layer.sublayerTransform = perspective;
    //创建基本动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    //创建关键路径
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(- M_PI_2);
    //每次动画的时长
    animation.duration = 2.0;
    //设置总动画时间
    animation.repeatDuration = INFINITY;
    //autoreverses--这个属性可以让门打开后沿原有路径关闭
    animation.autoreverses = YES;
    [doorlayer addAnimation:animation forKey:nil];
    
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
