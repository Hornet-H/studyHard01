//
//  HFLoginViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLoginViewController.h"

@interface HFLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Bubble1;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble2;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble3;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble4;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble5;
@property (weak, nonatomic) IBOutlet UIImageView *dot;
@property (weak, nonatomic) IBOutlet UIImageView *animateHub;

@end

@implementation HFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)configuration{
    self.Bubble1.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble2.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble3.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble4.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble5.transform = CGAffineTransformMakeScale(0, 0);
//    self.animateHub.hidden = YES;
   
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.animateHub.centerX -= kScreenWidth;
    self.dot.centerX -= kScreenWidth;

}
- (void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:0.3 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble1.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble4.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble5.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble2.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble3.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    
}
@end
