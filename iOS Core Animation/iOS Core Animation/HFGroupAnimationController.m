//
//  HFGroupAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFGroupAnimationController.h"

@interface HFGroupAnimationController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) CALayer *colorLayer;
@property (strong, nonatomic) CADisplayLink *displayLink;

@end

@implementation HFGroupAnimationController

- (instancetype)init{
    HFGroupAnimationController *CGPathVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CGPathVC = (HFGroupAnimationController *)[HFGroupAnimationController initStoryBoard];
    }
    return CGPathVC;
}

+(UIViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"groupAnimation" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFGroupAnimationController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    //创建路径
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    //创建图层并设置图层的路径
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    
    //创建色块图层
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 150);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    self.colorLayer = colorLayer;
    [self.containerView.layer addSublayer:self.colorLayer
     ];
    
    //创建关键帧动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation1,animation2];
    animationGroup.duration = 4.0;
    animationGroup.delegate = self;
    [colorLayer addAnimation:animationGroup forKey:nil];
    
}

-(void)refresh{
    self.colorLayer.position = self.colorLayer.presentationLayer.position;
    NSLog(@"%f",self.colorLayer.presentationLayer.position.x);
    if (self.colorLayer.presentationLayer.position.x >= 299) {
        self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.colorLayer.position = CGPointMake(300, 150);
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
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
