//
//  HFEasingViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFEasingViewController.h"

@interface HFEasingViewController ()
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *greenView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *orangeView;


@end

@implementation HFEasingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setupUI{
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.orangeView];
    
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
    [self.orangeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(3*kScreenWidth/5 + 50 + 3 * margin);
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
        [UIView animateWithDuration:1.0 animations:^{
            [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.view).offset(-100);
            }];
            [self.view layoutIfNeeded];
        }];
        
    }];
    /** 下面的效果是不一样的，注意观察，*/
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionRepeat animations:^{
        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionRepeat animations:^{
        [self.orangeView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
}

- (UIView *)orangeView{
    if (!_orangeView) {
        _orangeView = [[UIView alloc]init];
        _orangeView.backgroundColor = [UIColor orangeColor];
    }

    return _orangeView;
}

- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc]init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)greenView{
    if (!_greenView) {
        _greenView = [[UIView alloc]init];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    
    return _greenView;
}
- (UIView *)blueView{
    if (!_blueView) {
        _blueView = [[UIView alloc]init];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}


@end
