//
//  NSObject+Settings.m
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import "Plist.h"

@implementation Plist

-(id) initWithFileName:(NSString *)fileName
{
    self = [super init];
    if(self)
    {
         plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
         dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    }
    return self;
}

-(NSString *)GetValue:(NSString *)SectionName
{
    return [dictionary objectForKey:SectionName];
}
@end
