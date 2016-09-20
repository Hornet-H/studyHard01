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
@property (assign, nonatomic) CGFloat recodeDot;
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
    self.recodeDot = self.dot.centerX;
    self.animateHub.centerX -= kScreenWidth;
    self.dot.centerX -= kScreenWidth/2;

}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.animateHub.centerX -= kScreenWidth;
//    self.dot.centerX -= kScreenWidth;
//}
- (void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:0.3 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble1.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble4.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble5.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble2.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble3.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.5 options:0 animations:^{
        self.animateHub.centerX = kScreenWidth/2;
        
    } completion:nil];
    
    [UIView animateWithDuration:5 delay:0.6 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:0 animations:^{
        self.dot.centerX = self.recodeDot;
    } completion:nil];
}
@end
