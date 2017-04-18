//
//  HFCalayerDelegateController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/17.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCalayerDelegateController.h"

@interface HFCalayerDelegateController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation HFCalayerDelegateController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *colorLayer = [[CALayer alloc]init];
//    UIImage *image = [UIImage imageNamed:@"glass"];
    colorLayer.delegate = self;
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    colorLayer.contentsGravity = kCAGravityCenter;
    colorLayer.frame = CGRectMake(10, 10, 80, 80);
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:colorLayer];
    [colorLayer display];

    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);

}

@end
