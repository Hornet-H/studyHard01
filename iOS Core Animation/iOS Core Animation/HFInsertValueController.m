//
//  HFInsertValueController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/15.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFInsertValueController.h"
#import "CAKeyframeAnimation+AHEasing.h"
@interface HFInsertValueController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation HFInsertValueController

- (instancetype)init{
    HFInsertValueController *InsertValueVC = nil;
    if (self = [super init]) {
        InsertValueVC = (HFInsertValueController *)[HFInsertValueController initStoryBoard];
        
    }
    return InsertValueVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"InsertValueController" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFInsertValueController"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
        imageView.backgroundColor = [UIColor greenColor];
        imageView.layer.cornerRadius = 50;
        imageView.clipsToBounds = YES;
        [self.containerView addSubview:imageView];
        imageView;
    });
    [self animate];
}

float interpolate (float from,float to,float time){

    return (to - from) * time + from;

}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //获取类型
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
        
    return [NSValue valueWithCGPoint:result];
        }
    }
    return (time < 0.5)? fromValue: toValue;
}


- (void)animate{
    self.imageView.center = CGPointMake(150, 32);
    NSValue *fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    CFTimeInterval duration = 1.0;
    NSInteger numFrames = duration * 60;
    NSMutableArray *frames = [NSMutableArray array];
    for (int i = 0; i < numFrames; i ++) {
        float time = 1 / (float)numFrames * i;
        time = BounceEaseOut(time);
        [frames addObject:[self interpolateFromValue:fromValue toValue:toValue time:time]];
        
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    animation.values = frames;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animate];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
