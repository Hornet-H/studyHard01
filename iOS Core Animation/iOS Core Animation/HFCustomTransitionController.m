//
//  HFCustomTransitionController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCustomTransitionController.h"

@interface HFCustomTransitionController ()

@end

@implementation HFCustomTransitionController
- (instancetype)init{
    HFCustomTransitionController *CGPathVC = nil;
    if (self = [super init]) {
               CGPathVC = (HFCustomTransitionController *)[HFCustomTransitionController initStoryBoard];
    }
    return CGPathVC;
}

+ (UIViewController *)initStoryBoard{
    return [[UIStoryboard storyboardWithName:@"CustomTransition" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFCustomTransitionController"];
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    if ([UIDevice currentDevice].orientation != UIDeviceOrientationPortrait) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    }

}

- (IBAction)performTrasition{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    UIView *coverView = [[UIImageView alloc]initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    [self.view addSubview:coverView];
    self.view.backgroundColor = randomColor;
    [UIView animateWithDuration:1.0 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        coverView.transform = transform;
        coverView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        [coverView removeFromSuperview];
    }];
  
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)rotatingScreen:(UIButton *)sender {
    if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
        NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    }
}

- (IBAction)performTransition:(UIButton *)sender {
    //开启图形上下文
    
    
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
