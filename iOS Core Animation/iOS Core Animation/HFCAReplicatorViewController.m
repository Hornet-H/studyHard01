//
//  HFCAReplicatorViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/29.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAReplicatorViewController.h"

@interface HFCAReplicatorViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end

@implementation HFCAReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(20, 20, 200, 200);
    [self.containerView.layer addSublayer:replicatorLayer];
    replicatorLayer.instanceCount = 20;
    
    CATransform3D transform = CATransform3DIdentity;
//    CATransform3DTranslate(transform, 0,2, 0);
    transform = CATransform3DRotate(transform, M_PI / 10, 0, 0, 1);
//    transform = CATransform3DTranslate(transform, 0, -2, 0);
    replicatorLayer.instanceTransform = transform;
    
    replicatorLayer.instanceBlueOffset = - 0.1;
    replicatorLayer.instanceGreenOffset = - 0.1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30.f, 30.f, 30.f, 30.f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
