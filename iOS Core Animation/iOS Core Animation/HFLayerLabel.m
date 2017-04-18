//
//  HFLayerLabel.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/28.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFLayerLabel.h"

@implementation HFLayerLabel

+ (Class)layerClass{

    return [CATextLayer class];
}

- (CATextLayer *)textLayer{


    return (CATextLayer *)self.layer;
}

- (void)setUp{
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    self.backgroundColor = self.backgroundColor;
    //we should really derive these from the UILabel settings too
    //but that's complicated, so for now we'll just hard-code them
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    [self.layer display];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}
- (void)setText:(NSString *)text{
    super.text = text;
    [self textLayer].string = text;
}
- (void)setTextColor:(UIColor *)textColor{
    super.textColor = textColor;
    [self textLayer].foregroundColor = textColor.CGColor;

}
- (void)setFont:(UIFont *)font{
    super.font = font;
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);

}
@end
