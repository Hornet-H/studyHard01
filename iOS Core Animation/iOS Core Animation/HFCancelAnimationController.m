//
//  HFCancelAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCancelAnimationController.h"

@interface HFCancelAnimationController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) CALayer *shipLayer;

@end

@implementation HFCancelAnimationController

- (instancetype)init{
    HFCancelAnimationController *CancelAnimationVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CancelAnimationVC = (HFCancelAnimationController *)[HFCancelAnimationController initStoryBoard];
    }
    return CancelAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"CancelAnimation" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFCancelAnimationController"];
    
}
- (IBAction)start:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    
}
- (IBAction)stop:(id)sender {
    
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(150, 100);
    self.shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:self.shipLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
