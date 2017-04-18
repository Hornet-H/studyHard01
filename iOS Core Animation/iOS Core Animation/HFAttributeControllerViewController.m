//
//  HFAttributeControllerViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/6.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFAttributeControllerViewController.h"

@interface HFAttributeControllerViewController ()<CAAnimationDelegate>
@property (strong, nonatomic) CALayer *colorLayer;

@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation HFAttributeControllerViewController

-(instancetype)init{
    HFAttributeControllerViewController * presentationLayerVC = nil;
    if (self = [super init]) {
        
        presentationLayerVC  = [HFAttributeControllerViewController initStoryBoard];
    }
    return presentationLayerVC;

}

+ (HFAttributeControllerViewController *)initStoryBoard{
    
    
    return [[UIStoryboard storyboardWithName:@"Attribute" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFAttributeControllerViewController"];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
    
}

- (IBAction)changeColorBtnClick:(UIButton *)sender {
    
    UIColor *color = randomColor;
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id _Nullable)(color.CGColor);
    animation.delegate = self;
    [self.colorLayer addAnimation:animation forKey:nil];
    
}

//当跟新属性的时候，需要设置一个新的事务，并且禁用如层的行为，否则动画会发生两次，一个是因为显示的CABasicAnimation，另一个是因为隐式的
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
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
