//
//  NSObject+Settings.h
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plist:NSObject
{
    NSString *plistPath;
    NSMutableDictionary *dictionary;
}
-(id) initWithFileName:(NSString *)fileName;
-(NSString *)GetValue:(NSString *)SectionName;
-(NSString *) GetValueByPath:(NSString *)path;
-(void)SetValue:(NSString *)sectionValue SectionPath:(NSString *)sectionPath;
-(void)SetValue:(NSString *)sectionValue SectionName:(NSString *)sectionName;
@end
