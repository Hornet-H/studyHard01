//
//  HFCATextLyerViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/25.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCATextLyerViewController.h"
#import <CoreText/CoreText.h>

#import "HFLayerLabel.h"

@interface HFCATextLyerViewController ()
@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (strong, nonatomic) HFLayerLabel *layerLable;

@end

@implementation HFCATextLyerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setTextThroughTextLayer];
//    [self setAttributedStringTextLayer];
    [self setUpUI];
}

- (void)setUpUI{

    self.layerLable = [[HFLayerLabel alloc]initWithFrame:CGRectMake(0, 84, 100, 100)];
//    self.layerLable.backgroundColor = [UIColor redColor];                      ?????????????????????????????????
    self.layerLable.text = @"大黄蜂的测试";
    self.layerLable.font = [UIFont systemFontOfSize:15];
    self.layerLable.textColor = [UIColor greenColor];
    [self.view addSubview:self.layerLable];
}


- (void)setAttributedStringTextLayer{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.labelView.layer addSublayer:textLayer];
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \n leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \n fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \n lobortis";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
    
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    NSDictionary *attris = @{
                             (__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)kCTFontAttributeName : (__bridge id)fontRef
                             };
    [attributedString setAttributes:attris range:NSMakeRange(0, [text length])];
    attris = @{
               (__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor redColor].CGColor,
               (__bridge id)kCTUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle),
               (__bridge id)kCTFontAttributeName : (__bridge id)fontRef,
               };
    [attributedString setAttributes:attris range:NSMakeRange(6, 5)];
    CFRelease(fontRef);
    textLayer.string = attributedString;
}

- (void)setTextThroughTextLayer{

    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer
     ];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    UIFont *font = [UIFont systemFontOfSize:15];
    
    /** 本例中并没有用到下面三行代码，这只是用来告诉你怎么将一个UIFont类型转化成CGFontRef类型*/
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    CGFontRelease(fontRef);
    
    textLayer.fontSize = font.pointSize;
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \n leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \n fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \n lobortis";
    /** string是id类型，可以用来接受富文本*/
    textLayer.string = text;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
