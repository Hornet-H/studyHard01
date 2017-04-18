//
//  HFKeyframeAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/7.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFKeyframeAnimationController.h"

@interface HFKeyframeAnimationController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation HFKeyframeAnimationController
-(instancetype)init{
    HFKeyframeAnimationController *KeyframeAnimationController = nil;
    if (self = [super init]) {
        
        KeyframeAnimationController = (HFKeyframeAnimationController *)[HFKeyframeAnimationController initStoryBoard];
    }

    return KeyframeAnimationController;
}
+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"keyFrameAnimation" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFKeyframeAnimationController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    [self.layerView.layer addSublayer:self.colorLayer];
    
}


- (IBAction)changeColor:(UIButton *)sender {
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"backgroundColor";
    keyFrameAnimation.duration = 2.0;
    //注意颜色的最后的颜色和初始值得颜色一致，是为了动画的平滑性，因为如果不一致会出现颜色在动画借宿后突然闪到初始值的情况，这是其中的一种解决办法，还有一种解决办法就是不断的更新属性，使得动画开始之前，属性和最后一帧得得值保持一致
    keyFrameAnimation.values = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    [self.colorLayer addAnimation:keyFrameAnimation forKey:nil];
    
}









@end
