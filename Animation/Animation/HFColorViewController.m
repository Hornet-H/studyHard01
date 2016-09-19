//
//  HFColorViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/18.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFColorViewController.h"

@interface HFColorViewController ()
@property (strong, nonatomic) UIView *greenView;

@end

@implementation HFColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.view addSubview:self.greenView];
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(kScreenWidth/5);
        make.height.equalTo(kScreenWidth/5);
    }];
    [self performSelector:@selector(opacityChange) withObject:nil afterDelay:1.0];
    
    
}
- (void)opacityChange{
    
    [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(kScreenWidth/5 * 2);
        make.height.equalTo(kScreenWidth/5 * 2);
    }];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:1.0 animations:^{
        self.greenView.backgroundColor = [UIColor blueColor];
        [self.view layoutIfNeeded];
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
