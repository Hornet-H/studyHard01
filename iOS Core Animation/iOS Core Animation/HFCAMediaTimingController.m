//
//  HFCAMediaTimingController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAMediaTimingController.h"

@interface HFCAMediaTimingController ()<UITextFieldDelegate,CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *durationTextField;

@property (weak, nonatomic) IBOutlet UITextField *repeatCountTextField;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;

@property (strong, nonatomic) CALayer *shipLayer;


@end

@implementation HFCAMediaTimingController
- (instancetype)init{
    HFCAMediaTimingController *mediaTimingVC = nil;
    if (self = [super init]) {
//        NSString *class = NSStringFromClass([self class]);
        if ([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight) {
            NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight];
            [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
        }
        mediaTimingVC = (HFCAMediaTimingController *)[HFCAMediaTimingController initStoryBoard];
        
    }

    return mediaTimingVC;
}

+ (UIViewController *)initStoryBoard{


    return [[UIStoryboard storyboardWithName:@"CAMediaTiming" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HFCAMediaTimingController"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.durationTextField.delegate = self;
    self.durationTextField.returnKeyType = UIReturnKeyDone;
    self.durationTextField.keyboardAppearance = UIKeyboardTypeDecimalPad;
    
    self.repeatCountTextField.delegate = self;
    self.repeatCountTextField.returnKeyType = UIReturnKeyDone;
    self.repeatCountTextField.keyboardAppearance = UIKeyboardTypeDecimalPad;
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(150, 80);
    self.shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    [self.containerView.layer addSublayer:self.shipLayer];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;{

    [self.view endEditing:YES];
    [self.view endEditing:YES];
    return YES;
}

- (void)setControlsEnabled:(BOOL)enabled{
    for (UIControl *control in @[self.durationTextField,self.repeatCountTextField,self.startBtn]) {
        control.enabled = enabled;
        control.alpha = enabled ? 1.0f : 0.25f;
    }
}

- (IBAction)startBtnClick:(UIButton *)sender{
    
    CFTimeInterval duration = [self.durationTextField.text doubleValue];
    float repeatCount = [self.repeatCountTextField.text floatValue];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    [self setControlsEnabled:NO];
    
    
}

- (IBAction)endBtnClick:(UIButton *)sender {
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setControlsEnabled:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
