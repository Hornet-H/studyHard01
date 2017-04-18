//
//  HFChildViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFChildViewController.h"

@interface HFChildViewController ()

@end

@implementation HFChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)HFButtonClick:(UIButton *)sender {
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    
}
@end
