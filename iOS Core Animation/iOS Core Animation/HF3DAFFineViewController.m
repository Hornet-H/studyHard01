//
//  HF3DAFFineViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/23.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HF3DAFFineViewController.h"

@interface HF3DAFFineViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation HF3DAFFineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 透视效果
    [self perspectiveView];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500;
    self.containView.layer.sublayerTransform = perspective;
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.imageView1.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(- M_PI_4, 0, 1, 0);
    self.imageView2.layer.transform = transform2;
    
}





- (void)perspectiveView{

    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 =  -1.0/500;
    
    transform3D = CATransform3DRotate(transform3D,M_PI_4, 0, 1, 0);
    //    transform3D = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.imageView.layer.transform = transform3D;
    

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
