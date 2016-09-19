//
//  HFBaseViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBaseViewController.h"

@interface HFBaseViewController ()

@end

@implementation HFBaseViewController

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if (kIOSVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configuration];
    [self setupUI];

}
- (void)configuration{


}

- (void)setupUI{



}

@end
