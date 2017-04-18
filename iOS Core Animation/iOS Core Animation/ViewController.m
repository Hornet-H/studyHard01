//
//  ViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/17.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *coneView;
@property (weak, nonatomic) IBOutlet UIView *shipView;
@property (weak, nonatomic) IBOutlet UIView *iglooView;
@property (weak, nonatomic) IBOutlet UIView *anchorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *colorLayer = [[CALayer alloc]init];
    UIImage *image = [UIImage imageNamed:@"glass"];
    colorLayer.contents = (__bridge id _Nullable)(image.CGImage);
    colorLayer.contentsGravity = kCAGravityCenter;
    colorLayer.frame = CGRectMake(10, 10, 80, 80);
//    colorLayer.contentsScale = image.scale;
//    self.layerView.layer.contentsScale = image.scale;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:colorLayer];
    
   
    [self addSpriteImage:[UIImage imageNamed:@"拼接"] withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.coneView.layer];
    [self addSpriteImage:[UIImage imageNamed:@"拼接"] withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.shipView.layer];
    [self addSpriteImage:[UIImage imageNamed:@"拼接"] withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.iglooView.layer];
    [self addSpriteImage:[UIImage imageNamed:@"拼接"] withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.anchorView.layer];


}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer{
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //set contentsRect
    layer.contentsRect = rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
