//
//  HFLoginViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLoginViewController.h"
#import "HFLoginSucessViewController.h"

@interface HFLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *Bubble1;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble2;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble3;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble4;
@property (weak, nonatomic) IBOutlet UIImageView *Bubble5;
@property (weak, nonatomic) IBOutlet UIImageView *dot;
@property (weak, nonatomic) IBOutlet UIImageView *animateHub;
@property (assign, nonatomic) CGFloat recodeDot;

@property (weak, nonatomic) IBOutlet UITextField *userNameTeField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) UIImageView *warningMessageImageView;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (assign, nonatomic) CGPoint loginPosition;

@end

@implementation HFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginPosition = CGPointZero;
}

- (void)configuration{
    
    self.userNameTeField.delegate = self;
    self.passWordTextField.delegate = self;
    
    self.Bubble1.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble2.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble3.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble4.transform = CGAffineTransformMakeScale(0, 0);
    self.Bubble5.transform = CGAffineTransformMakeScale(0, 0);
    self.recodeDot = self.dot.centerX;
    self.animateHub.centerX -= kScreenWidth;
    self.dot.centerX -= kScreenWidth/2;
    /** 设置填充视图*/
    UIView *paddingViewForUsername = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, self.userNameTeField.height)];
    self.userNameTeField.leftView = paddingViewForUsername;
    self.userNameTeField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *userImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"User"]];
    userImageView.origin = CGPointMake(13, 10);
    [self.userNameTeField addSubview:userImageView];
    
    
    UIView *paddingViewForPassWord = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, self.passWordTextField.height)];
    self.passWordTextField.leftView = paddingViewForPassWord;
    self.passWordTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *passWordImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Key"]];
    passWordImageView.origin = CGPointMake(12, 9);
    [self.passWordTextField addSubview:passWordImageView];
    
    self.userNameTeField.centerX -= kScreenWidth;
    self.passWordTextField.centerX -= kScreenWidth;
    
    self.loginPosition = self.loginButton.center;
    self.loginButton.centerX -= kScreenWidth;
    
    [self.view addSubview:self.warningMessageImageView];
    self.warningMessageImageView.hidden = YES;
    self.warningMessageImageView.center = self.loginPosition;
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [self configuration];
    [UIView animateWithDuration:0.3 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble1.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble4.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble5.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        self.Bubble2.transform = CGAffineTransformMakeScale(1, 1);
        self.Bubble3.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.5 options:0 animations:^{
        self.animateHub.centerX = kScreenWidth/2;
        
    } completion:nil];
    
    [UIView animateWithDuration:5 delay:0.6 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:0 animations:^{
        self.dot.centerX = self.recodeDot;
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.7 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.userNameTeField.centerX += kScreenWidth;
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.passWordTextField.centerX += kScreenWidth;
    } completion:nil];
    [UIView animateWithDuration:0.3 delay:0.9 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginButton.centerX += kScreenWidth;
    } completion:nil];
    
}
- (IBAction)loginClick:(UIButton *)sender {
    NSString *userName = self.userNameTeField.text;
    NSString *passWord = self.passWordTextField.text;
    self.spinner.origin = CGPointMake(12, 12);
    [self.loginButton addSubview:self.spinner];
    [self.spinner startAnimating];
    
    SEL selector = NSSelectorFromString(@"netDelayWithUserName:passWord:");
    NSInvocation *invacation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:selector]];
    [invacation setSelector:selector];
    [invacation setTarget:self];
    [invacation setArgument:&userName atIndex:2];
    [invacation setArgument:&passWord atIndex:3];
    [invacation invoke];
}

- (void)netDelayWithUserName:(NSString *)userName passWord:(NSString *)password{

    
    [UIView transitionWithView:self.warningMessageImageView duration:0.3 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        self.warningMessageImageView.hidden = YES;
    } completion:nil];
    
    if ([userName isEqualToString:@"datouerzi"] && [password isEqualToString:@"123456"]) {
        self.warningMessageImageView.hidden = YES;
        [self.spinner removeFromSuperview];
        HFLoginSucessViewController *sucessViewController = [[HFLoginSucessViewController alloc]initWithTitle:@"成功登陆"];
        [self.navigationController pushViewController:sucessViewController animated:YES];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.loginButton.center = self.loginPosition;
        } completion:^(BOOL finished) {
            self.loginButton.centerX -= 30;
            
            [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:0 animations:^{
                self.loginButton.centerX += 30;
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    self.loginButton.centerY += 90;
                    [self.spinner removeFromSuperview];
                } completion:^(BOOL finished) {
                    [UIView transitionWithView:self.warningMessageImageView duration:0.3 options:UIViewAnimationOptionTransitionFlipFromBottom|UIViewAnimationOptionCurveEaseOut animations:^{
                        self.warningMessageImageView.hidden = NO;
                    } completion:nil];
                }];
                
            }];
        }];
        
        
        
    }


}

- (void)textFieldDidBeginEditing:(UITextField *)textField{

    self.warningMessageImageView.hidden = YES;

}

- (UIImageView *)warningMessageImageView{
    if (!_warningMessageImageView) {
        _warningMessageImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Warning"]];
           }

    return _warningMessageImageView;
}
- (UIActivityIndicatorView *)spinner{
    if (!_spinner) {
        _spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    return _spinner;
}

@end
