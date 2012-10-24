//
//  ViewController.h
//  YL
//
//  Created by  rtsafe02 on 12-9-24.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MainWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
