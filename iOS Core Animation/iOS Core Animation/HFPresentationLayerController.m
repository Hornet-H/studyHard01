//
//  HFPresentationLayerController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/5.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFPresentationLayerController.h"

@interface HFPresentationLayerController ()
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation HFPresentationLayerController


- (instancetype)init{
    HFPresentationLayerController * presentationLayerVC = nil;
    if (self = [super init]) {
        
       presentationLayerVC  = [HFPresentationLayerController initStoryBoard];
    }
       return presentationLayerVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame  = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        self.colorLayer.backgroundColor = randomColor.CGColor;
    }else{
    //移动colorLayer到新的位置
    //开启事务
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }


}


+ (HFPresentationLayerController *)initStoryBoard{
  
    
    return [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HFPresentationLayerController"];;
}

- (void)awakeFromNib{
    [super awakeFromNib];
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
