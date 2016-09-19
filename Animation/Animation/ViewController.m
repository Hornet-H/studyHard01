//
//  ViewController.m
//  Animation
//
//  Created by 黄来峰 on 16/9/14.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "ViewController.h"
#import "HFPositionViewController.h"
#import "HFOpacityViewController.h"
#import "HFScaleViewController.h"
#import "HFColorViewController.h"
#import "HFRatationViewController.h"
#import "HFRepeatViewController.h"
#import "HFEasingViewController.h"
#import "HFSpringViewController.h"
#import "HFLoginViewController.h"
#import "HFKeyFrameViewController.h"
#import "HFLoginAutoLayoutViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) NSArray *controllerArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupUI{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *str = self.dataArr[indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = self.controllerArr[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    return;
}

- (NSArray *)controllerArr{
    if (!_controllerArr) {
        _controllerArr = @[[[HFPositionViewController alloc]initWithTitle:@"Position" ],
                           [[HFOpacityViewController alloc]initWithTitle:@"Opacity"],
                           [[HFScaleViewController alloc]initWithTitle:@"Scale"],
                           [[HFColorViewController alloc]initWithTitle:@"Color"],
                           [[HFRatationViewController alloc]initWithTitle:@"Ratation"],
                           [[HFRepeatViewController alloc]initWithTitle:@"Repeat"],
                           [[HFEasingViewController alloc]initWithTitle:@"Easing"],
                           [[HFSpringViewController alloc]initWithTitle:@"Spring"],
                           [[HFLoginViewController alloc]initWithTitle:@"Login"],
                           [[HFKeyFrameViewController alloc]initWithTitle:@"KeyFrame"],
                           [[HFLoginAutoLayoutViewController alloc]initWithTitle:@"Login-AutoLayout"]
                          ];
        
        
    }
    return _controllerArr;

}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"Position",
                     @"Opacity",
                     @"Scale",
                     @"Color",
                     @"Ratation",
                     @"Repeat",
                     @"Easing",
                     @"Spring",
                     @"Login",
                     @"KeyFrame",
                     @"Login-AutoLayout"
                     ];
    }

    return _dataArr;
}


@end
