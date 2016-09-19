//
//  HFPositionViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFPositionViewController.h"

@interface HFPositionViewController ()
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *greenView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIButton *actionButton;
@property (assign, nonatomic) BOOL isNomal;

@end

@implementation HFPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.actionButton];
    
    
}
- (void)viewDidAppear:(BOOL)animated{
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 1;
    }];
   
    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.leading.equalTo(self.view).offset(margin);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    
    [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.leading.equalTo(self.view).offset(2 * margin + margin + kScreenWidth/5);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.leading.equalTo(self.view).offset(4 * margin + margin + 2*kScreenWidth/5);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    [self.actionButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redView.mas_bottom).offset(50);
        make.width.equalTo(100);
        make.height.equalTo(30);
        make.centerX.equalTo(self.view);
    }];
    self.isNomal = YES;
    [self.view setNeedsUpdateConstraints];

    [self.view layoutIfNeeded];

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
[self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    obj.alpha = 0;
}];

}
- (void)actionButtonClick:(UIButton *)sender{
    if (self.isNomal) {
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.view).offset( - kScreenWidth + margin);
        }];
        
        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        
    }else{
    
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.view).offset( margin);
        }];
    }
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraints];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.view layoutIfNeeded];
    }];
    
    self.isNomal = !self.isNomal;
    
}

- (UIButton *)actionButton{
    if (!_actionButton) {
        _actionButton = [[UIButton alloc]init];
        [_actionButton setTitle:@"动起来" forState:UIControlStateNormal];
        [_actionButton setTitleColor:randomColor forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(actionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _actionButton;
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
