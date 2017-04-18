//
//  HFCAMediaTimingFunctionController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAMediaTimingFunctionController.h"

@interface HFCAMediaTimingFunctionController ()
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation HFCAMediaTimingFunctionController
- (instancetype)init{
    HFCAMediaTimingFunctionController *CAMediaTimingFunctionVC = nil;
    if (self = [super init]) {
        //        NSString *class = NSStringFromClass([self class]);
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CAMediaTimingFunctionVC = (HFCAMediaTimingFunctionController *)[HFCAMediaTimingFunctionController initStoryBoard];
        
    }
    
    return CAMediaTimingFunctionVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"CAMediaTimingFunction" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFCAMediaTimingFunctionController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [self.view.layer addSublayer:self.colorLayer];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    self.colorLayer.position = [[touches anyObject]locationInView:self.view];
    [CATransaction commit];
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
