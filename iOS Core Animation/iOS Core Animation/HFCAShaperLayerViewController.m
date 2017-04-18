//
//  HFCAShaperLayerViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/25.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAShaperLayerViewController.h"

@interface HFCAShaperLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *ContainView;

@end

@implementation HFCAShaperLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawPeople];
    [self drawCustomizeRounded];
    
}


/** 定制圆角*/
- (void)drawCustomizeRounded{
    CGRect rect = CGRectMake(125, 250, 100, 100);
    CGSize radisLeft = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radisLeft];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.ContainView.layer addSublayer:shapeLayer];

}

- (void)drawPeople{

    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    /** 添加头的路径*/
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    /** 添加脖子的路径*/
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    /** 左腿的路径*/
    [path addLineToPoint:CGPointMake(125, 225)];
    /** 移动初始点*/
    [path moveToPoint:CGPointMake(150, 175)];
    /** 右腿的路径*/
    [path addLineToPoint:CGPointMake(175, 225)];
    /** 移动起点*/
    [path moveToPoint:CGPointMake(100, 150)];
    /** 手臂的路径*/
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.ContainView.layer addSublayer:shapeLayer];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
