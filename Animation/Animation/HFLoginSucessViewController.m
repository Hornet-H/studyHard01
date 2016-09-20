//
//  HFLoginSucessViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/20.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLoginSucessViewController.h"

@interface HFLoginSucessViewController ()

@end

@implementation HFLoginSucessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)setupUI{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    label.text = @"登录成功";
    label.textColor = randomColor;
}

@end
