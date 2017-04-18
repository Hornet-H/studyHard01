//
//  HFScrollView.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/30.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFScrollView.h"

@implementation HFScrollView
+ (Class)layerClass{


    return [CAScrollLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}


- (void)setUp{
    self.layer.masksToBounds = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)recognizer{

    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    
    NSLog(@"------xxxxxxxxxx-------%f",[recognizer translationInView:self].x);
    NSLog(@"------yyyyyyyyyy-------%f",[recognizer translationInView:self].y);
    
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    [recognizer setTranslation:CGPointZero inView:self];
    
}


@end
