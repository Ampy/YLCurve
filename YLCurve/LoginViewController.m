//
//  LoginViewController.m
//  YL
//
//  Created by  rtsafe02 on 12-9-26.
//  Copyright (c) 2012年 ampy. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize UserName;
@synthesize Password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        Reachability * re =[Reachability reachabilityWithHostname:[Settings Instance].ServiceUrl];
        NetworkStatus mp = [re currentReachabilityStatus];
        if(mp==ReachableViaWiFi)
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提醒" message:@"网络不通，请联系管理员" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            alert.tag=100;
            [alert show];

        };
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:    (NSInteger)buttonIndex
{

    if(alertView.tag==100 && buttonIndex==0)
    {
        exit(1);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return ((interfaceOrientation ==UIDeviceOrientationLandscapeLeft)||(interfaceOrientation ==UIDeviceOrientationLandscapeRight));
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.

    
    self.LoginFrame.layer.cornerRadius=10;    //设置弹出框为圆角视图
    self.LoginFrame.layer.masksToBounds = YES;
    self.LoginFrame.layer.borderWidth = 2;   //设置弹出框视图边框宽度
    self.LoginFrame.layer.borderColor = [[UIColor colorWithRed:0.50 green:0.10 blue:0.10 alpha:0.5] CGColor];   //设置弹出框边框颜色
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoginButtonClick:(id)sender {
    NSString *urlstr = [[Settings Instance].ServiceUrl stringByAppendingString:@"/iPadAccount/LogOn"];
    //NSURL *url = [NSURL URLWithString: @"http://10.211.55.3:1229/iPadAccount/LogOn"];
    NSURL *url = [NSURL URLWithString: urlstr];
    NSString *body = [NSString stringWithFormat: @"UserName=%@&Password=%@&RememberMe=%@&RememberMe=%@",UserName.text,Password.text,@"true",@"false"];
    ////
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    //
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];

    
    NSURLResponse *reponse;
    
    NSError *error = nil;
    
    //
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&reponse error:&error];
    
    if (error) {
        int mp = error.code;
        switch (error.code) {
            case -1001:
            {
                UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示" message:@"连接超时！请联系管理员" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alert show];
            
                break;
            }
                
            default:
                break;
        }
        NSLog(@"Something wrong: %@,code :%d",[error description],mp);
        
    }else {
        
        if (responseData) {
            
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            
            NSLog(@"get %@",responseString);
            if([responseString isEqualToString:@"\"YES\""])
            {
                ViewController * inspectview = [[ViewController alloc] init];
                [self presentViewController:inspectview animated:YES completion :^(void){
                    return ;
                }];
            }
            else
            {
                UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名口令不正确！" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alert show];
            }
            
        }

    //[MainWebView loadRequest: request];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification
{
//    static CGFloat normalKeyboardHeight = 216.0f;
//    
//    NSDictionary *info = [notification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//    
//    CGFloat distanceToMove = kbSize.height - normalKeyboardHeight;
    originRect=self.LoginFrame.frame;
    self.LoginFrame.frame=CGRectMake(originRect.origin.x, originRect.origin.y-80, originRect.size.width, originRect.size.height);
    //自适应代码
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    self.LoginFrame.frame=originRect;
}

@end
