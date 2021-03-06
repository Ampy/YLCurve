//
//  NSObject+Settings.m
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import "Settings.h"
static Settings *globalSettings = nil;
@implementation Settings
@synthesize ServiceUrl;

+(Settings *)Instance{
    @synchronized(self){
        if(globalSettings == nil){
            globalSettings=[[self alloc] init];
        }
    }
    return globalSettings;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (globalSettings == nil) {
            globalSettings = [super allocWithZone:zone];
            
            //读取配置表Settings.plist
            Plist *plist = [[Plist alloc] initWithFileName:@"Settings"];           
            globalSettings.ServiceUrl = [plist GetValue:@"ServiceUrl"];
            
            return  globalSettings;
        }
    }
    return nil;
}

@end
