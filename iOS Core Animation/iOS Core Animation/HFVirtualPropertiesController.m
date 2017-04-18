//
//  HFVirtualPropertiesController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFVirtualPropertiesController.h"

@interface HFVirtualPropertiesController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HFVirtualPropertiesController
- (instancetype)init{
    HFVirtualPropertiesController *CGPathVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CGPathVC = (HFVirtualPropertiesController *)[HFVirtualPropertiesController initStoryBoard];
    }
    return CGPathVC;
}

+(UIViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"VirtualProperties" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFVirtualPropertiesController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self transform1];
//    [self transform2];
//    [self transform3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)transform1{
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 100);
    shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:shipLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform";
    basicAnimation.duration = 2.0;
    basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:basicAnimation forKey:nil];
    
    
}

- (void)transform2{
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 100);
    shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:shipLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform";
    basicAnimation.duration = 2.0;
    basicAnimation.byValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:basicAnimation forKey:nil];
    
    
}
- (void)transform3{
    
    //!!!!!!!!注意属性动画实际上是针对路径本身做动画可以是从 basicAnimation.keyPath = @"transform.rotation"看的出来
    /*用transform.rotation而不是transform做动画的好处如下：
    
     我们可以不通过关键帧一步旋转多于180度的动画。
     可以用相对值而不是绝对值旋转（设置byValue而不是toValue）。
     可以不用创建CATransform3D，而是使用一个简单的数值来指定角度。
     不会和transform.position或者transform.scale冲突（同样是使用关键路径来做独立的动画属性）。
     
     transform.rotation属性有一个奇怪的问题是它其实并不存在。这是因为CATransform3D并不是一个对象，它实际上是一个结构体，也没有符合KVC相关属性，transform.rotation实际上是一个CALayer用于处理动画变换的虚拟属性。你不可以直接设置transform.rotation或者transform.scale，他们不能被直接使用。当你对他们做动画时，Core Animation自动地根据通过CAValueFunction来计算的值来更新transform属性.
     */
    
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 100);
    shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:shipLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform.rotation";
    basicAnimation.duration = 2.0;
    basicAnimation.byValue = @(2 * M_PI);
    [shipLayer addAnimation:basicAnimation forKey:nil];
    
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
