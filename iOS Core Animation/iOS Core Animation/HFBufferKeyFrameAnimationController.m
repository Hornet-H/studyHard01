//
//  HFBufferKeyFrameAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBufferKeyFrameAnimationController.h"

@interface HFBufferKeyFrameAnimationController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;


@end

@implementation HFBufferKeyFrameAnimationController
- (instancetype)init{
    HFBufferKeyFrameAnimationController *BufferKeyFrameAnimationVC = nil;
    if (self = [super init]) {
               BufferKeyFrameAnimationVC = (HFBufferKeyFrameAnimationController *)[HFBufferKeyFrameAnimationController initStoryBoard];
        
    }
    return BufferKeyFrameAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"BufferKeyFrameAnimation" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFBufferKeyFrameAnimationController"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
    
    
    
    
}
- (IBAction)changColorBtnClick:(UIButton *)sender {
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"backgroundColor";
    keyFrameAnimation.duration = 5.0;
    keyFrameAnimation.values = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    keyFrameAnimation.timingFunctions = @[fn,fn,fn];
    [self.colorLayer addAnimation:keyFrameAnimation forKey:nil];
    
}



@end
