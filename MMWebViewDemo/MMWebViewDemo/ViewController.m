//
//  ViewController.m
//  MMWebViewDemo
//
//  Created by LEA on 2017/5/22.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "ViewController.h"
#import "MMWebView.h"

@interface ViewController () <MMWebViewDelegate>

@property (nonatomic, strong) MMWebView * webView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化
    _webView = [[MMWebView alloc] initWithFrame:self.view.bounds];
    // 代理
    _webView.delegate = self;
    // 显示进度条
    _webView.displayProgressBar = YES;
    // 允许侧滑返回
    _webView.allowsBackForwardNavigationGestures = YES;
    // 加载
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com"]]];
    // 添加视图
    [self.view addSubview:_webView];
}

#pragma mark - MMWebViewDelegate
// 网页加载进度
- (void)webView:(MMWebView *)webView estimatedProgress:(CGFloat)progress
{
    NSLog(@"%f",progress);
}

// 网页标题更新
- (void)webView:(MMWebView *)webView didUpdateTitle:(NSString *)title
{
    self.title = title;
}

// 网页开始加载
- (BOOL)webView:(MMWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(WKNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest");
    return YES;
}

// 网页开始加载
- (void)webViewDidStartLoad:(MMWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}

// 网页完成加载
- (void)webViewDidFinishLoad:(MMWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

// 网页加载出错
- (void)webView:(MMWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError");
}

#pragma mark - 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
