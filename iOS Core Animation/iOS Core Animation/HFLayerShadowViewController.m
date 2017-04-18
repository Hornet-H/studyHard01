//
//  HFLayerShadowViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/21.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLayerShadowViewController.h"

@interface HFLayerShadowViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation HFLayerShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self setShadowByAttribute];
    [self fromKeyPath];
    
   
}

- (void)fromKeyPath{
    self.layerView.layer.shadowOpacity = 0.5f;
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView.bounds);
    self.layerView.layer.shadowPath = squarePath;
    self.layerView.layer.shadowColor = [UIColor greenColor].CGColor;
    self.layerView.layer.backgroundColor = [UIColor clearColor].CGColor;
    CGPathRelease(squarePath);
    
    
    self.layerView2.layer.shadowOpacity = 0.5f;
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath;
    self.layerView2.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layerView2.layer.shadowColor = [UIColor greenColor].CGColor;
    CGPathRelease(circlePath);


}


/** 通过属性来设置阴影的可视性*/
- (void)setShadowByAttribute{
    
    self.layerView.layer.cornerRadius = 20.0f;
    self.layerView.layer.borderWidth = 5.0f;
    self.layerView.layer.masksToBounds = YES;
    
    self.shadowView.layer.shadowOpacity = 0.5;
    self.shadowView.layer.shadowColor = [UIColor greenColor].CGColor;
    self.shadowView.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.shadowView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.shadowView.layer.shadowRadius = 5.0f;
    
    
    
    self.layerView2.layer.cornerRadius = 20.0f;
    self.layerView2.layer.borderWidth = 5.0f;
    
    self.layerView2.layer.shadowOpacity = 0.5;
    self.layerView2.layer.shadowColor = [UIColor greenColor].CGColor;
    self.layerView2.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layerView2.layer.shadowRadius = 5.0f;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
