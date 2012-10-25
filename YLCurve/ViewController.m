//
//  ViewController.m
//  YL
//
//  Created by  rtsafe02 on 12-9-24.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

@synthesize MainWebView;
@synthesize activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //NSURL *cookieHost = [NSURL URLWithString:@"http://ampygroup.com:7086"];
    // 設定 cookie
    //NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
    //                        [NSDictionary dictionaryWithObjectsAndKeys:
    //                         [cookieHost host], NSHTTPCookieDomain,
    //                         [cookieHost path], NSHTTPCookiePath,
    //                         @"COOKIE_NAME",  NSHTTPCookieName,
    //                         @"COOKIE_VALUE", NSHTTPCookieValue,
    //                         nil]];
    // 設定 cookie 到 storage 中
    //[[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    // 建立 NSURLRequest 連到 cookie.php，連線的時候會自動加入上面設定的 Cookie
    NSString *urlstr = [[Settings Instance].ServiceUrl stringByAppendingString:@"/iPadCurve/DrawCurve?index=0"];
    //NSURL *url = [NSURL URLWithString: @"http://10.211.55.3:1229/iPadAccount/LogOn"];
    NSURL *url = [NSURL URLWithString: urlstr];
    
    //NSString *urlAddress = @"http://10.211.55.3:1229/iPadCurve/DrawCurve?index=0";
    //NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
	// Do any additional setup after loading the view, typically from a nib.
    //NSURL *url =[NSURL URLWithString:@"http://ampygroup.com:7086"];
    
    //NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    MainWebView.delegate=self;
 
   [MainWebView loadRequest:request];
    
    //UserName=%E9%AB%98%E6%98%8E%E5%96%84&Password=abcd@1234&RememberMe=true&RememberMe=false

//    NSURL *url = [NSURL URLWithString: @"http://10.211.55.3:8080/iPadAccount/LogOn"];
//    NSString *body = [NSString stringWithFormat: @"UserName=%@&Password=%@&RememberMe=%@&RememberMe=%@", @"高伟明",@"abcd@1234",@"true",@"false"];
////
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
//    
//    [request setHTTPMethod: @"POST"];
//    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
    
    //NSArray* cookies = [NSArray arrayWithObjects: @"NOPCOMMERCE.AUTH", nil];
    //NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    
    //[request setAllHTTPHeaderFields:headers];
    
    
    
//    [MainWebView loadRequest: request];
    
//    NSMutableArray *webViewParams = [NSMutableArray arrayWithObjects:
//                                     @"UserName", @"高伟明",
//                                     @"Password", @"abcd@1234",
//                                     @"RememberMe", @"true",
//                                     nil];
//    [self UIWebViewWithPost:self.MainWebView url:@"http://ampygroup.com:7086/Account/LogOn" params:webViewParams];
    
//    NSString *urlAddress = @"http://ampygroup.com:7086/Account/LogOn";
//    NSURL *url = [NSURL URLWithString:urlAddress];
//    
//    NSString *post = @"UserName=高伟明&Password=abcd@1234";
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding];
//    
//    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod: @"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:postData];
//    
//    [MainWebView loadRequest:request];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    activityIndicator.hidden=false;
    [activityIndicator startAnimating];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [activityIndicator stopAnimating];
    activityIndicator.hidden=true;
    
//    NSHTTPCookie *cookie;
//    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (cookie in [cookieJar cookies]) {
//        NSLog(@"%@:%@", cookie.name,cookie.value);
//    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UIWebViewWithPost:(UIWebView *)uiWebView url:(NSString *)url params:(NSMutableArray *)params
{
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    [s appendString: [NSString stringWithFormat:@"<html><body onload=\"document.forms[0].submit()\">"
                      "<form method=\"post\" action=\"%@\">", url]];
    if([params count] % 2 == 1) { NSLog(@"UIWebViewWithPost error: params don't seem right"); return; }
    for (int i=0; i < [params count] / 2; i++) {
        [s appendString: [NSString stringWithFormat:@"<input type=\"hidden\" name=\"%@\" value=\"%@\" >\n", [params objectAtIndex:i*2], [params objectAtIndex:(i*2)+1]]];
    }
    [s appendString: @"</input></form></body></html>"];
    //NSLog(@"%@", s);
    
   

    [uiWebView loadHTMLString:s baseURL:nil];
}
- (IBAction)InputButtonClick:(id)sender {
    //NSURL *url =[NSURL URLWithString:@"http://10.211.55.3:1229/iPadCurve/InsertData?index=0"];
    NSString *urlstr = [[Settings Instance].ServiceUrl stringByAppendingString:@"/iPadCurve/InsertData?index=0"];
    //NSURL *url = [NSURL URLWithString: @"http://10.211.55.3:1229/iPadAccount/LogOn"];
    NSURL *url = [NSURL URLWithString: urlstr];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    //MainWebView.delegate=self;
    
    [MainWebView loadRequest:request];
    
}
- (IBAction)BackButtonClick:(id)sender {
    [MainWebView goBack];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return ((interfaceOrientation ==UIDeviceOrientationLandscapeLeft)||(interfaceOrientation ==UIDeviceOrientationLandscapeRight));
}
- (IBAction)LogOutButtonClick:(id)sender {
    LoginViewController * inspectview = [[LoginViewController alloc] init];
    [self presentViewController:inspectview animated:YES completion :^(void){
        return ;
    }];
}

@end
