//
//  HFSpringViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFSpringViewController.h"

@interface HFSpringViewController ()
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *greenView;
@property (strong, nonatomic) UIView *blueView;


@end

@implementation HFSpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setupUI{
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    
    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view).offset(-100);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    
    [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kScreenWidth/5 + 50 + margin);
        make.centerX.equalTo(self.view).offset(-100);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2*kScreenWidth/5 + 50 + 2 * margin);
        make.centerX.equalTo(self.view).offset(-100);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.0 animations:^{
//            [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.centerX.equalTo(self.view).offset(-100);
//            }];
//            [self.view layoutIfNeeded];
//        }];
        
    }];
    
    /**
     Duration:动画时长
     Damping:阻尼
     Velocity:初始速度
     options:动画的方式
     
     */
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:UIViewAnimationOptionRepeat animations:^{
        
        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:UIViewAnimationOptionRepeat animations:^{
        
        [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
}


- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc]init];
        _redView.backgroundColor = [UIColor redColor];
        _redView.tag = 100;
    }
    return _redView;
}

- (UIView *)greenView{
    if (!_greenView) {
        _greenView = [[UIView alloc]init];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.tag = 101;
    }
    
    return _greenView;
}
- (UIView *)blueView{
    if (!_blueView) {
        _blueView = [[UIView alloc]init];
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.tag = 102;
    }
    return _blueView;
}

@end
