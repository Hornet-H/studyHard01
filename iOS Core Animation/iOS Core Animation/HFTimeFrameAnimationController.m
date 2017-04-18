//
//  HFTimeFrameAnimationController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/15.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTimeFrameAnimationController.h"
#import "CAKeyframeAnimation+AHEasing.h"

@interface HFTimeFrameAnimationController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval timeOffset;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;

@end

@implementation HFTimeFrameAnimationController

- (instancetype)init{
    HFTimeFrameAnimationController *TimeFrameAnimationVC = nil;
    if (self = [super init]) {
        TimeFrameAnimationVC = (HFTimeFrameAnimationController *)[HFTimeFrameAnimationController initStoryBoard];
        
    }
    return TimeFrameAnimationVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"TimeFrameAnimation" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFTimeFrameAnimationController"];
    
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
float interrpolate (float from,float to,float time){
    
    return (to - from) * time + from;
    
}
- (void)animate{
    self.imageView.center = CGPointMake(150, 32);
    self.duration = 2.0;
    self.timeOffset = 0.0;
    
    self.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    self.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 / 60 target:self selector:@selector(step:) userInfo:nil repeats:YES];
    
//    NSInteger numFrames = self.duration * 60;
//    NSMutableArray *frames = [NSMutableArray array];
//    for (int i = 0; i < numFrames; i ++) {
//        float time = 1 / (float)numFrames * i;
//        time = BounceEaseOut(time);
//        [frames addObject:[self interpolateFromValue:self.fromValue toValue:self.toValue time:time]];
//        
//    }
//    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 1.0;
//    animation.delegate = self;
//    animation.values = frames;
//    [self.imageView.layer addAnimation:animation forKey:nil];
    
    
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [(NSValue *)fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interrpolate(from.x, to.x, time), interrpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    //provide safe default implementation
    return (time < 0.5)? fromValue: toValue;
}


float bounceEaseOut(float t){
    
    if (t < 4 / 11.0) {
        return (121 * t * t) / 16.0;
    }else if (t < 8 / 11.0){
        return (363 / 40.0 * t * t) - (99 / 10.0 * t) + 17 / 5.0;
        
    }else if (t < 9 / 10.0) {
        return (4356 / 361.0 * t * t) - (35442 / 1805.0 * t) + 16061 / 1805.0;
    }
    return (54 / 5.0 * t * t) - (513 / 25.0 * t) + 268 / 25.0;
}


- (void)step:(NSTimer *)step{
    
    self.timeOffset = MIN(self.timeOffset + 1/60.0, self.duration);
    //get normalized time offset (in range 0 - 1)
    float time = self.timeOffset / self.duration;
    //apply easing
    time = bounceEaseOut(time);
    //interpolate position
    id position = [self interpolateFromValue:self.fromValue
                                     toValue:self.toValue time:time];
    //move ball view to new position
    self.imageView.center = [position CGPointValue];
    //stop the timer if we've reached the end of the animation
    if (self.timeOffset >= self.duration) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animate];
    
}
//“iOS上的每个线程都管理了一个NSRunloop，字面上看就是通过一个循环来完成一些任务列表。但是对主线程，这些任务包含如下几项：”

//摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
//NSRunLoop
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    
//}

//处理触摸事件
//发送和接受网络数据包
//执行使用gcd的代码
//处理计时器行为
//屏幕重绘”

//屏幕重绘的频率是一秒钟六十次，但是和定时器行为一样，如果列表中上一个执行了很长时间，它也会延迟。这些延迟都是一个随机值，于是就不能保证定时器精准地一秒钟执行六十次。有时候发生在屏幕重绘之后，这就会使得更新屏幕会有个延迟，看起来就是动画卡壳了。有时候定时器会在屏幕更新的时候执行两次，于是动画看起来就跳动了。

//我们可以用CADisplayLink让更新频率严格控制在每次屏幕刷新之后。
//基于真实帧的持续时间而不是假设的更新频率来做动画。
//调整动画计时器的run loop模式，这样就不会被别的事件干扰。”


@end
