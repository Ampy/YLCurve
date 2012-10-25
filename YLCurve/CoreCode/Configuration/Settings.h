//
//  NSObject+Settings.h
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings:NSObject
@property (nonatomic, retain) NSString* ServiceUrl;
+(Settings *)Instance;
@end
