//
//  HFCAEmitterLayerController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/30.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAEmitterLayerController.h"

@interface HFCAEmitterLayerController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HFCAEmitterLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Spark.png"].CGImage);
    cell.birthRate = 50;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 40;
//    cell.velocityRange = -10;
    cell.emissionRange = M_PI * 2.0;
    emitter.emitterCells = @[cell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}

@end
