//
//  HFTransitionController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTransitionController.h"

@interface HFTransitionController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *images;

@end

@implementation HFTransitionController

- (instancetype)init{
    HFTransitionController *CGPathVC = nil;
    if (self = [super init]) {
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        CGPathVC = (HFTransitionController *)[HFTransitionController initStoryBoard];
    }
    return CGPathVC;
}

+ (UIViewController *)initStoryBoard{
    return [[UIStoryboard storyboardWithName:@"Transition" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFTransitionController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.images = @[[UIImage imageNamed:@"001" ],[UIImage imageNamed:@"002"],[UIImage imageNamed:@"003"],[UIImage imageNamed:@"004"],[UIImage imageNamed:@"005"]];
    
}
- (IBAction)switchBtnClick:(UIButton *)sender {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    [self.imageView.layer addAnimation:transition forKey:nil];
    UIImage *currentImage = self.imageView.image;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index + 1) % self.images.count;
    self.imageView.image = self.images[index];
}

@end
