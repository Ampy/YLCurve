//
//  ViewController.m
//  YL
//
//  Created by  rtsafe02 on 12-9-24.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end



@implementation MainViewController

@synthesize MainWebView;
@synthesize WaitingView;
@synthesize ActivityIndicatorView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.WaitingView.layer.cornerRadius=10;    //设置弹出框为圆角视图
    self.WaitingView.layer.masksToBounds = YES;

    NSString *urlstr = [[Settings Instance].ServiceUrl stringByAppendingString:@"/iPadCurve/DrawCurve?index=0"];

    NSURL *url = [NSURL URLWithString: urlstr];
    

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    
    MainWebView.delegate=self;
 
   [MainWebView loadRequest:request];
    

    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    //activityIndicator.hidden=false;
    WaitingView.hidden=false;
    [ActivityIndicatorView startAnimating];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [ActivityIndicatorView stopAnimating];
    WaitingView.hidden=true;
    //activityIndicator.hidden=true;

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

    [uiWebView loadHTMLString:s baseURL:nil];
}
- (IBAction)InputButtonClick:(id)sender {

    NSString *urlstr = [[Settings Instance].ServiceUrl stringByAppendingString:@"/iPadCurve/InsertData?index=0"];

    NSURL *url = [NSURL URLWithString: urlstr];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    
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

- (void)viewDidUnload {
    [self setWaitingView:nil];
    [self setActivityIndicatorView:nil];
    [super viewDidUnload];
}
@end
