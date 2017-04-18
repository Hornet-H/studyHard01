//
//  HFBasicViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBasicViewController.h"

@interface HFBasicViewController ()

@end

@implementation HFBasicViewController
- (instancetype)init{
    
    if (self = [super init]) {
//                NSString *class = NSStringFromClass([self class]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
        NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    }


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
