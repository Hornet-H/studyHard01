//
//  HFAffineViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/22.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFAffineViewController.h"
/** 弧度转角度*/
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)

@interface HFAffineViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *animationButton;

@end

@implementation HFAffineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)transForm{

    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    self.layerView.transform = transform;

}

- (void)tranformScaleMove{

    [self animationClick:self.animationButton];

}

- (IBAction)animationClick:(UIButton *)sender {
    [UIView animateWithDuration:0.6 animations:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, 0.5, 0.5);
        transform = CGAffineTransformRotate(transform, M_PI/180 * 30);
        transform = CGAffineTransformTranslate(transform, 200, 0);
        
        self.layerView.layer.affineTransform = transform;
        
    }];
    
}

- (IBAction)transClick:(UIButton *)sender {
    [self transForm];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
