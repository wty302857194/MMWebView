//
//  MMWebView.h
//  MMWebView
//
//  Created by LEA on 2017/5/22.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol MMWebViewDelegate;
@interface MMWebView : WKWebView <WKNavigationDelegate>

//代理
@property (nonatomic,assign) id<MMWebViewDelegate> delegate;
//是否显示进度条
@property (nonatomic,assign) BOOL displayProgressBar;
//displayProgressBar为True是可用
@property(nonatomic, strong) UIColor *progressTintColor;
//displayProgressBar为True是可用
@property(nonatomic, strong) UIColor *trackTintColor;

@end

@protocol MMWebViewDelegate <NSObject>

@optional
// 网页加载进度
- (void)webView:(MMWebView *)webView estimatedProgress:(CGFloat)progress;
// 网页标题更新
- (void)webView:(MMWebView *)webView didUpdateTitle:(NSString *)title;

// 网页开始加载
- (BOOL)webView:(MMWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(WKNavigationType)navigationType;
// 网页开始加载
- (void)webViewDidStartLoad:(MMWebView *)webView;
// 网页完成加载
- (void)webViewDidFinishLoad:(MMWebView *)webView;
// 网页加载出错
- (void)webView:(MMWebView *)webView didFailLoadWithError:(NSError *)error;

@end
