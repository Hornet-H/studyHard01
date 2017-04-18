//
//  HFLayerTreeController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLayerTreeController.h"

@interface HFLayerTreeController ()

@end

@implementation HFLayerTreeController
- (instancetype)init{
    HFLayerTreeController *CGPathVC = nil;
    if (self = [super init]) {
        CGPathVC = (HFLayerTreeController *)[HFLayerTreeController initStoryBoard];
    }
    return CGPathVC;
}

+ (UIViewController *)initStoryBoard{
    return [[UIStoryboard storyboardWithName:@" layerTreeAnimation" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFLayerTreeController"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
