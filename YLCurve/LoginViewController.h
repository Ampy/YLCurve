//
//  LoginViewController.h
//  YL
//
//  Created by  rtsafe02 on 12-9-26.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "Reachability.h"
#import "Settings.h"

@interface LoginViewController : UIViewController
{
    CGRect originRect;
       dispatch_queue_t queue;
}

@property (weak, nonatomic) IBOutlet UIView *LoginFrame;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UIView *WaitingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityIndicatorView;

@end
