//
//  ViewController.h
//  YL
//
//  Created by  rtsafe02 on 12-9-24.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "LoginViewController.h"

@interface MainViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MainWebView;

@property (weak, nonatomic) IBOutlet UIView *WaitingView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityIndicatorView;

@end
