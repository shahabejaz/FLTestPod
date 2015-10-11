//
//  FileUtil.m
//  SCBCommon
//
//  Created by Greg Martin on 1/2/11.
//  Copyright 2011 Standard Chartered Bank. All rights reserved.
//

#import "FileUtil.h"


@implementation FileUtil

+ (NSString *)documentsDirectory
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


+ (NSString *)cacheDirectory
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)resourceDirectory
{
	return [[NSBundle mainBundle] resourcePath];
}

+ (NSURL*)documentUrlForFile:(NSString*)filename {
	NSString *path = [[self documentsDirectory] stringByAppendingPathComponent:filename];
	return [NSURL fileURLWithPath:path];
}

+ (NSURL*)resourceUrlForFile:(NSString*)filename {
	return [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
}

+ (BOOL)createDocument:(NSString*)documentFile withContentsOfString:(NSString*)string updateDate:(NSDate*)date {
	NSString *path = [[self documentsDirectory] stringByAppendingPathComponent:documentFile];
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *attributes = [NSDictionary dictionaryWithObject:date forKey:NSFileModificationDate];
	return [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:attributes];
}

+ (NSString *)documentPath:(NSString*)filename {
	return [[self documentsDirectory] stringByAppendingPathComponent:filename];
}

+ (BOOL)documentExists:(NSString*)documentName {
	return [[NSFileManager defaultManager] fileExistsAtPath:[self documentPath:documentName]];	
}
			
@end
