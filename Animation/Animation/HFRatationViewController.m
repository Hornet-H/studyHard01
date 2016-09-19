//
//  HFRatationViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRatationViewController.h"

@interface HFRatationViewController ()
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation HFRatationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)setupUI{
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(300);
    }];


}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self rotatingImageView];
}
- (void)rotatingImageView{
    /** UIViewAnimationOptionCurveLinear这个属性可以让两次动画衔接的时候不间断*/
[UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
} completion:^(BOOL finished) {
    [self rotatingImageView];
}];


}
- (UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"wheel"];
    }
    return _imageView;
}
@end
