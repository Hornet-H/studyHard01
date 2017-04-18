//
//  HFClockViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/21.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFClockViewController.h"

@interface HFClockViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation HFClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *digits = [UIImage imageNamed:@"闹钟"];
    for (UIView *view in self.digitViews) {
        view.layer.contents = (__bridge id _Nullable)(digits.CGImage);
        view.layer.magnificationFilter = kCAFilterNearest;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];

}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view{
//调整ContentsRect
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.12, 1.0);
}


- (void)tick{
    NSCalendar*calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *componets = [calender components:units fromDate:[NSDate date]];
    [self setDigit:componets.hour / 10 forView:self.digitViews[0]];
    [self setDigit:componets.hour % 10 forView:self.digitViews[1]];
    [self setDigit:componets.minute / 10 forView:self.digitViews[2]];
    [self setDigit:componets.minute % 10 forView:self.digitViews[3]];
    [self setDigit:componets.second / 10 forView:self.digitViews[4]];
    [self setDigit:componets.second % 10 forView:self.digitViews[5]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


@end
