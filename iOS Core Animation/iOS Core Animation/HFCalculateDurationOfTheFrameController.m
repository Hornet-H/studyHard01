//
//  HFCalculateDurationOfTheFrameController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/16.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCalculateDurationOfTheFrameController.h"

@interface HFCalculateDurationOfTheFrameController ()
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, assign) CFTimeInterval duration;
@property (nonatomic, assign) CFTimeInterval timeOffset;
@property (nonatomic, assign) CFTimeInterval lastStep;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;

@end

@implementation HFCalculateDurationOfTheFrameController

- (instancetype)init{
    HFCalculateDurationOfTheFrameController *CalculateDurationOfTheFrameVC = nil;
    if (self = [super init]) {
        CalculateDurationOfTheFrameVC = (HFCalculateDurationOfTheFrameController *)[HFCalculateDurationOfTheFrameController initStoryBoard];
        
    }
    return CalculateDurationOfTheFrameVC;
}

+ (UIViewController *)initStoryBoard{
    
    return [[UIStoryboard storyboardWithName:@"CalculateDurationOfFrame" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFCalculateDurationOfTheFrameController"];
    
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

- (void)animate
{
    //reset ball to top of screen
    self.imageView.center = CGPointMake(150, 32);
    //configure the animation
    self.duration = 1.0;
    self.timeOffset = 0.0;
    self.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    self.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    //stop the timer if it's already running
    [self.timer invalidate];
    //start the timer
    self.lastStep = CACurrentMediaTime();
    self.timer = [CADisplayLink displayLinkWithTarget:self
                                              selector:@selector(step:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop]
                     forMode:NSDefaultRunLoopMode];
}

- (void)step:(CADisplayLink *)timer
{
    //calculate time delta
    CFTimeInterval thisStep = CACurrentMediaTime();
    CFTimeInterval stepDuration = thisStep - self.lastStep;
    self.lastStep = thisStep;
    //update time offset
    self.timeOffset = MIN(self.timeOffset + stepDuration, self.duration);
    //get normalized time offset (in range 0 - 1)
    float time = self.timeOffset / self.duration;
    //apply easing
    time = bouncesEaseOut(time);
    //interpolate position
    id position = [self interpolateFromValue:self.fromValue toValue:self.toValue time:time];    //move ball view to new position
    self.imageView.center = [position CGPointValue];
    //stop the timer if we've reached the end of the animation
    if (self.timeOffset >= self.duration) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

float bouncesEaseOut(float t){
    
    if (t < 4 / 11.0) {
        return (121 * t * t) / 16.0;
    }else if (t < 8 / 11.0){
        return (363 / 40.0 * t * t) - (99 / 10.0 * t) + 17 / 5.0;
        
    }else if (t < 9 / 10.0) {
        return (4356 / 361.0 * t * t) - (35442 / 1805.0 * t) + 16061 / 1805.0;
    }
    return (54 / 5.0 * t * t) - (513 / 25.0 * t) + 268 / 25.0;
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time{
        if ([fromValue isKindOfClass:[NSValue class]]) {
            //get type
            const char *type = [(NSValue *)fromValue objCType];
            if (strcmp(type, @encode(CGPoint)) == 0) {
                CGPoint from = [fromValue CGPointValue];
                CGPoint to = [toValue CGPointValue];
                CGPoint result = CGPointMake(intrrpolate(from.x, to.x, time), intrrpolate(from.y, to.y, time));
                return [NSValue valueWithCGPoint:result];
            }
        }
        //provide safe default implementation
        return (time < 0.5)? fromValue: toValue;
}


float intrrpolate (float from,float to,float time){
        
        return (to - from) * time + from;
        
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animate];
}

    
@end
