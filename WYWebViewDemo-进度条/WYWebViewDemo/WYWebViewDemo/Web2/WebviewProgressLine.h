//
//  WebviewProgressLine.h
//  WYWebViewDemo
//
//  Created by cl9000 on 2018/6/22.
//  Copyright © 2018年 cl9000. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebviewProgressLine : UIView

//进度条颜色
@property (nonatomic,strong) UIColor  *lineColor;
//开始加载
-(void)startLoadingAnimation;
//结束加载
-(void)endLoadingAnimation;

@end
