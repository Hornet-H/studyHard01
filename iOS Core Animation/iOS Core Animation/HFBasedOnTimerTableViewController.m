//
//  HFBasedOnTimerTableViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/15.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBasedOnTimerTableViewController.h"

@interface HFBasedOnTimerTableViewController ()

@property (strong, nonatomic) NSArray *viewControllers;

@end

@implementation HFBasedOnTimerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    if ([UIDevice currentDevice].orientation != UIDeviceOrientationPortrait) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:self.viewControllers[indexPath.row] animated:YES];
    
}
- (NSArray *)viewControllers{
    if (!_viewControllers) {
        _viewControllers = @[[NSClassFromString(@"HFTimeFrameAnimationController")  new],
                             [NSClassFromString(@"HFCalculateDurationOfTheFrameController")  new],
                             [NSClassFromString(@"HFBufferKeyFrameAnimationController")  new],
                             [NSClassFromString(@"HFRetrieveController") new],
                             [NSClassFromString(@"HFKeyframeAnimationBufferController") new],
                             [NSClassFromString(@"HFInsertValueController") new]
                             ] ;
    }
    
    
    return _viewControllers;
}
@end
