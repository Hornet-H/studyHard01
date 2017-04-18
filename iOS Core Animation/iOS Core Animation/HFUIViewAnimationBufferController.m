//
//  HFUIViewAnimationBufferController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFUIViewAnimationBufferController.h"

@interface HFUIViewAnimationBufferController ()
@property (strong, nonatomic) UIView *colorView;

@end

@implementation HFUIViewAnimationBufferController
- (instancetype)init{
    HFUIViewAnimationBufferController *UIViewAnimationBufferVC = nil;
    if (self = [super init]) {
        //        NSString *class = NSStringFromClass([self class]);
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        UIViewAnimationBufferVC = (HFUIViewAnimationBufferController *)[HFUIViewAnimationBufferController initStoryBoard];
        
    }
    
    return UIViewAnimationBufferVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"AnimationBuffer" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFUIViewAnimationBufferController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorView = [[UIView alloc]init];
    self.colorView.bounds = CGRectMake(0, 0, 100, 100);
    self.colorView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.colorView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint point = [[touches anyObject] locationInView:self.view];
[UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
    self.colorView.center = point;
    self.colorView.backgroundColor = randomColor;
} completion:NULL];
    
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
