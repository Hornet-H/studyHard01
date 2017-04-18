//
//  HFUIViewTransitionController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFUIViewTransitionController.h"

@interface HFUIViewTransitionController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *images;


@end

@implementation HFUIViewTransitionController
- (instancetype)init{
    HFUIViewTransitionController *CGPathVC = nil;
    if (self = [super init]) {
        CGPathVC = (HFUIViewTransitionController *)[HFUIViewTransitionController initStoryBoard];
    }
    return CGPathVC;
}

+ (UIViewController *)initStoryBoard{
    return [[UIStoryboard storyboardWithName:@"HFUIViewTransitionController" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFUIViewTransitionController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.images = @[[UIImage imageNamed:@"001"],[UIImage imageNamed:@"002"],[UIImage imageNamed:@"003"],[UIImage imageNamed:@"004"],[UIImage imageNamed:@"005"]];
    
}
- (IBAction)switchBtnClick:(id)sender {
    [UIView transitionWithView:self.imageView duration:1.0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        UIImage *currentImage = self.imageView.image;
        NSUInteger index = [self.images indexOfObject:currentImage];
        index = (index + 1) % self.images.count;
        self.imageView.image = self.images[index];
        
    } completion:^(BOOL finished) {
        
    }];
    
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
