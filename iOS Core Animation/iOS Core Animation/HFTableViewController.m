//
//  HFTableViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/6.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTableViewController.h"
#import "HFPresentationLayerController.h"
#import "HFAttributeControllerViewController.h"
#import "HFClockAniTagViewController.h"
#import "HFKeyframeAnimationController.h"
#import "HFkeyFrameAnimationCGPathController.h"
#import "HFVirtualPropertiesController.h"
#import "HFGroupAnimationController.h"
#import "HFTransitionController.h"
#import "HFLayerTreeController.h"
#import "HFUIViewTransitionController.h"
#import "HFCustomTransitionController.h"
#import "HFCancelAnimationController.h"
#import "HFCAMediaTimingController.h"
#import "HFRepeatViewController.h"
#import "HFRelativeTimeController.h"
#import "HFManualAnimationController.h"


@interface HFTableViewController ()<UITabBarControllerDelegate>

@end

@implementation HFTableViewController

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

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 20;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 12) {
        HFPresentationLayerController *presentationLayerVC = [[HFPresentationLayerController alloc] init];
        [self.navigationController pushViewController:presentationLayerVC animated:YES];
    }
     if (indexPath.row == 13) {
         HFAttributeControllerViewController *attributeVC = [[HFAttributeControllerViewController alloc] init];
         [self.navigationController pushViewController:attributeVC animated:YES];
     }
    if (indexPath.row == 14) {
        HFClockAniTagViewController *clockAniTagVC= [[HFClockAniTagViewController alloc] init];
        [self.navigationController pushViewController:clockAniTagVC animated:YES];
    }
    if (indexPath.row == 15) {
        HFKeyframeAnimationController *keyframeAnimationVC = [[HFKeyframeAnimationController alloc] init];
        [self.navigationController pushViewController:keyframeAnimationVC animated:YES];
    }
    if (indexPath.row == 16) {
        HFkeyFrameAnimationCGPathController *keyframeAnimationCGPathVC = [[HFkeyFrameAnimationCGPathController alloc] init];
        [self.navigationController pushViewController:keyframeAnimationCGPathVC animated:YES];
    }
    if (indexPath.row == 17) {
        HFVirtualPropertiesController *virtualPropertiesVC = [[HFVirtualPropertiesController alloc] init];
        [self.navigationController pushViewController:virtualPropertiesVC animated:YES];
    }
    if (indexPath.row == 18) {
        HFGroupAnimationController *groupAnimationVC = [[HFGroupAnimationController alloc] init];
        [self.navigationController pushViewController:groupAnimationVC animated:YES];
    }
    if (indexPath.row == 19) {
        HFTransitionController *transitionVC = [[HFTransitionController alloc] init];
        [self.navigationController pushViewController:transitionVC animated:YES];
    }
    if (indexPath.row == 20) {
        HFLayerTreeController *LayerTreeVC  = [[HFLayerTreeController alloc] init];
        [self presentViewController:LayerTreeVC animated:YES completion:nil];

    }
    if (indexPath.row == 21) {
        HFUIViewTransitionController *UIViewTransitionVC  = [[HFUIViewTransitionController alloc] init];
        [self.navigationController pushViewController:UIViewTransitionVC animated:YES];
    }

    if (indexPath.row == 22) {
        HFCustomTransitionController *CustomTransitionVC  = [[HFCustomTransitionController alloc] init];
        [self.navigationController pushViewController:CustomTransitionVC animated:YES];
    }
    
    if (indexPath.row == 23) {
        HFCancelAnimationController *CancelAnimationVC  = [[HFCancelAnimationController alloc] init];
        [self.navigationController pushViewController:CancelAnimationVC animated:YES];
    }
    if (indexPath.row == 24) {
        HFCAMediaTimingController *MediaTimingVC  = [[HFCAMediaTimingController alloc] init];
        [self.navigationController pushViewController:MediaTimingVC animated:YES];
    }
    if (indexPath.row == 25) {
        HFRepeatViewController *RepeatVC  = [[HFRepeatViewController alloc] init];
        [self.navigationController pushViewController:RepeatVC animated:YES];
    }

    if (indexPath.row == 26) {
        HFRelativeTimeController *RelativeVC  = [[HFRelativeTimeController alloc] init];
        [self.navigationController pushViewController:RelativeVC animated:YES];
    }
    if (indexPath.row == 27) {
        HFManualAnimationController *ManualAnimationVC  = [[HFManualAnimationController alloc] init];
        [self.navigationController pushViewController:ManualAnimationVC animated:YES];
    }





}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
