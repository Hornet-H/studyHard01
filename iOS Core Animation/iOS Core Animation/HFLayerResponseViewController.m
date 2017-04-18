//
//  HFLayerResponseViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLayerResponseViewController.h"

@interface HFLayerResponseViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *blueLayer;

@end

@implementation HFLayerResponseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.blueLayer];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self conertPointWith:touches];
    [self convertPointWithHitTest:touches];
}

/** 利用Layer的坐标转换来实现*/
- (void)conertPointWith:(NSSet<UITouch *> *)touches {

    CGPoint point = [[touches anyObject] locationInView:self.view];
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.layerView.layer containsPoint:point]) {
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        if ([self.blueLayer containsPoint:point]) {
            UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"点击的点在该蓝色View中" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertVC addAction:confirmAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }else{
            UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"点击的点在该白色View中" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertVC addAction:confirmAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
    }
}

/** 利用hitTest方法获取图层*/
- (void)convertPointWithHitTest:(NSSet<UITouch *> *)touches{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"点击的点在蓝色View中" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:confirmAction];
        [self presentViewController:alertVC animated:YES completion:nil];

    }else if (layer == self.layerView.layer){
    
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"点击的点在白色View中" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:confirmAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    
    }else{
    
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"点击的点在灰色View中" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:confirmAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
