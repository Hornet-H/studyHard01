//
//  HFRasterizeViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/22.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRasterizeViewController.h"

@interface HFRasterizeViewController ()
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation HFRasterizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.containView.backgroundColor = [UIColor grayColor];
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(100, 50);
    [self.containView addSubview:button1];
    
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(100, 150);
    button2.alpha = 0.9;
    [self.containView addSubview:button2];
    //设置图层的栅格化
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
//
    
}

- (UIButton *)customButton{
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    //addLabel
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = @"Hello World";
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
  return button;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end
