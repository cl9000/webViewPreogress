//
//  WebViewController.m
//  WYWebViewDemo
//
//  Created by cl9000 on 2018/6/22.
//  Copyright © 2018年 cl9000. All rights reserved.
//

#import "WebViewController.h"
#import "WebviewProgressLine.h"

#define    IPHONX_NAV_HEIGHT 88.0
#define    kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView  *webview;
@property (nonatomic,strong) WebviewProgressLine  *progressLine;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 方案二
    self.webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webview.delegate = self;
    [self.view addSubview:self.webview];
    self.progressLine = [[WebviewProgressLine alloc] initWithFrame:CGRectMake(0, kDevice_Is_iPhoneX ? IPHONX_NAV_HEIGHT : 64, KScreenWidth, 2)];
    self.progressLine.lineColor = [UIColor redColor];
    [self.view addSubview:self.progressLine];
    NSURL *url = [NSURL URLWithString:@"https://you.163.com"];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressLine startLoadingAnimation];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.progressLine endLoadingAnimation];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressLine endLoadingAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
