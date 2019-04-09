//
//  ViewController.m
//  MMWebViewDemo
//
//  Created by LEA on 2017/5/22.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "ViewController.h"
#import "MMWebView.h"

@interface ViewController ()<MMWebViewDelegate>

@property (nonatomic, strong) MMWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demo";
    
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSString * appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL * baseURL = [NSURL fileURLWithPath:htmlPath];
    
    _webView = [[MMWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    _webView.displayProgressBar = YES; // 显示进度条
    _webView.allowBackGesture = YES;  // 允许侧滑返回
    [_webView setupJSBridge];  // JS交互
    [_webView registerHandler:@"testObjcCallback" handler:^(id data, WVJSResponseCallback responseCallback) {
        responseCallback(@"Response from testObjcCallback");
    }];
    [_webView callHandler:@"testJavascriptHandler" data:@{ @"foo":@"before ready" }];
    [_webView loadHTMLString:appHtml baseURL:baseURL];
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
