//
//  HFtransactionController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/2.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFtransactionController.h"

@interface HFtransactionController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation HFtransactionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    
    //过渡动画--这个单独的图层通过提供一个actions字典来控制隐式动画;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor":transition};
    [self.layerView.layer addSublayer:self.colorLayer];
    
}
- (IBAction)changeAction:(UIButton *)sender {
    
    //第一种方式
//    [self animateLayer];
    //第二种方式
//    [self animateLayerViewLayer];
    //第三种方式
    [self animateThroughActiond];
    
}

- (void)animateThroughActiond{
//    CGFloat red = arc4random_uniform(255) / (CGFloat)INT_MAX;
//    CGFloat green = arc4random_uniform(255) / (CGFloat) INT_MAX;
//    CGFloat blue = arc4random_uniform(255) / (CGFloat)INT_MAX;
//    self.colorLayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:red green:green blue:blue alpha:1.0]);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;

}

- (void)animateLayerViewLayer{
    
    
    //可以发现对UIView的图层直接使用事务进行动画，并没有效果，-----------注意！！！注意！！！注意！！！隐式动画被UIView的图层给禁用了---重要的事情说三遍,对于UIViewC的动画从开始[UIView beginAnimations]到[UIView CommitAnimations]结束，这是一个完整的动画块，当属性在动画块之外发生改变的时候 UIView的图层的代理方法 actionForLayer:forKey 的可以直接返回nil，当为nil的时候UIViewController的隐式动画会被禁用，除了返回nil之外，CATransaction本身也有一个方法+setDisableActions:，这个方法可以对所有属性打开或则关闭隐式动画；

    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        self.layerView.layer.backgroundColor = [UIColor redColor].CGColor;
    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat) INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.layerView.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:red green:green blue:blue alpha:1.0]);
    [CATransaction commit];

}


// 对独立的图层进行动画
- (void)animateLayer{

    [CATransaction begin];
    
    //----下面这句话开启之后颜色改变的动画回无效---但是成功之后的回调里面的动画没有影响
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:1.0];
    __weak typeof(self) weakSelf = self;
    //block块要在修改属性之前设置，否则会崩溃----不明白原因
    [CATransaction setCompletionBlock:^{
        
        //rotate the layer 90 degrees
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        weakSelf.colorLayer.affineTransform = transform;
        
        weakSelf.colorLayer.backgroundColor = [UIColor greenColor].CGColor;
        
    }];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat) INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:red green:green blue:blue alpha:1.0]);
    
    [CATransaction commit];


}

/*
 总结：
 UIView关联的图层禁用了隐式动画，对这种图层做动画的唯一办法就是使用UIView的动画函数（而不是依赖CATransaction），或者继承UIView，并覆盖-actionForLayer:forKey:方法，或者直“接创建一个显式动画（具体细节见第八章）。
 对于单独存在的图层，我们可以通过实现图层的-actionForLayer:forKey:委托方法，或者提供一个actions字典来控制隐式动画。
 
 */

@end
