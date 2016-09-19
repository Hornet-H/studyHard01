//
//  HFOpacityViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFOpacityViewController.h"

@interface HFOpacityViewController ()
@property (strong, nonatomic) UIView *greenView;

@end

@implementation HFOpacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    [self.view addSubview:self.greenView];
    [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.leading.equalTo(self.view).offset(2 * margin + margin + kScreenWidth/5);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    [self performSelector:@selector(opacityChange) withObject:nil afterDelay:1.0];
 
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    [self.view addSubview:self.greenView];
//    [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(200);
//        make.leading.equalTo(self.view).offset(2 * margin + margin + kScreenWidth/5);
//        make.width.equalTo(kScreenWidth/5);
//        make.height.equalTo(kScreenWidth/5);
//    }];
//    [self performSelector:@selector(opacityChange) withObject:nil afterDelay:1.0];
}
- (void)opacityChange{
    
    [UIView animateWithDuration:1 animations:^{
        self.greenView.alpha = 0.2;
    }];
    
}



- (UIView *)greenView{
    if (!_greenView) {
        _greenView = [[UIView alloc]init];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.tag = 101;
    }
    
    return _greenView;
}
@end
