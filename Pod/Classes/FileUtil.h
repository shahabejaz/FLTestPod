//
//  FileUtil.h
//  SCBCommon
//
//  Created by Greg Martin on 1/2/11.
//  Copyright 2011 Standard Chartered Bank. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FileUtil : NSObject
{
}

+ (NSString *)documentsDirectory;
+ (NSString *)cacheDirectory;
+ (NSString *)resourceDirectory;

+ (NSString *)documentPath:(NSString*)filename;

+ (NSURL*)documentUrlForFile:(NSString*)filename;
+ (NSURL*)resourceUrlForFile:(NSString*)filename;

+ (BOOL)createDocument:(NSString*)documentFile withContentsOfString:(NSString*)string updateDate:(NSDate*)date;
+ (BOOL)documentExists:(NSString*)documentName;

@end
