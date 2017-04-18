//
//  HFCAGradientLayerController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/29.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAGradientLayerController.h"

@interface HFCAGradientLayerController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HFCAGradientLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self normal];
    [self dontUseLocation];
    
    
}

- (void)normal{

    //CAGradientLayer的真正好处在于绘制使用了硬件加速。
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    //这个数组只接受CGColorRef类型
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.containerView.layer addSublayer:gradientLayer];

}

- (void)dontUseLocation{

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    //这个数组只接受CGColorRef类型
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    //注意color数组对应的元素个数和locations数组对应的元素个数要一致否则会返回一个空白图层
    gradientLayer.locations = @[@0.0,@0.25,@0.5];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.containerView.layer addSublayer:gradientLayer];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
