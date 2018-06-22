//
//  WebviewProgressLine.m
//  WYWebViewDemo
//
//  Created by I2finance on 2018/6/22.
//  Copyright © 2018年 wangyan. All rights reserved.
//

#import "WebviewProgressLine.h"
#import "UIView+Frame.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation WebviewProgressLine

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.backgroundColor = lineColor;
}

- (void)startLoadingAnimation{
    self.hidden = NO;
    self.width = 0.0;
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.width = KScreenWidth * 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.width = KScreenWidth * 0.8;
        }];
    }];
    
    
}

- (void)endLoadingAnimation{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.width = KScreenWidth;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}

@end
