//
//  HFKeyframeAnimationBufferController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFKeyframeAnimationBufferController.h"

@interface HFKeyframeAnimationBufferController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation HFKeyframeAnimationBufferController

- (instancetype)init{
    HFKeyframeAnimationBufferController *KeyframeAnimationBufferVC = nil;
    if (self = [super init]) {
        KeyframeAnimationBufferVC = (HFKeyframeAnimationBufferController *)[HFKeyframeAnimationBufferController initStoryBoard];
        
    }
    return KeyframeAnimationBufferVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"KeyframeAnimationBuffer" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFKeyframeAnimationBufferController"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
        imageView.backgroundColor = [UIColor greenColor];
        imageView.layer.cornerRadius = 50;
        imageView.clipsToBounds = YES;
        [self.containerView addSubview:imageView];
        imageView;
    });
    [self animate];
    
}


- (void)animate{
    self.imageView.center = CGPointMake(150, 32);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.delegate = self;
    animation.duration = 1.0;
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(150, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)]
                         ];
    
    animation.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                  ];
    animation.keyTimes = @[
                           @0.0,
                           @0.3,
                           @0.5,
                           @0.7,
                           @0.8,
                           @0.9,
                           @0.95,
                           @1.0
                           ];
    self.imageView.layer.position = CGPointMake(150, 268);
    [self.imageView.layer addAnimation:animation forKey:nil];


}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animate];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}

@end
