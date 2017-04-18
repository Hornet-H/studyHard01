//
//  HFRetrieveController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRetrieveController.h"

@interface HFRetrieveController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation HFRetrieveController
- (instancetype)init{
    HFRetrieveController *BufferKeyFrameAnimationVC = nil;
    if (self = [super init]) {
        BufferKeyFrameAnimationVC = (HFRetrieveController *)[HFRetrieveController initStoryBoard];
        
    }
    return BufferKeyFrameAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"RetrievePoint" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFRetrieveController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAMediaTimingFunction *MediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CGPoint controlPoint1,controlPoint2;
    [MediaTimingFunction getControlPointAtIndex:1 values:(float *) & controlPoint1];
    [MediaTimingFunction getControlPointAtIndex:2 values:(float *) & controlPoint2];
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointZero];
    [bezierPath addCurveToPoint:CGPointMake(1, 1) controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [bezierPath applyTransform:CGAffineTransformMakeScale(30, 30)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = bezierPath.CGPath;
    [self.layerView.layer addSublayer:shapeLayer];
//    self.layerView.layer.geometryFlipped = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
