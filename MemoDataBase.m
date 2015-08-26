//
//  FavDataBase.m
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MemoDataBase.h"
#import <PlausibleDatabase/PlausibleDatabase.h>

static PLSqliteDatabase * dbPointer;


@implementation MemoDataBase

//单例

+ (PLSqliteDatabase *) setup{
	if (dbPointer) {
		return dbPointer;
	}
	
//	NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
	NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *realPath = [documentPath stringByAppendingPathComponent:@"favBook.sqlite"];
	
	NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"FavBook" ofType:@"sqlite"];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:realPath]) {
		NSError *error;
		if (![fileManager copyItemAtPath:sourcePath toPath:realPath error:&error]) {
			NSLog(@"%@",[error localizedDescription]);
		}
	}
	
//	NSLog(@"复制sqlite到路径：%@成功。",realPath);
	
	//把dbpointer地址修改为可修改的realPath。
	dbPointer = [[PLSqliteDatabase alloc] initWithPath:realPath];
	
	[dbPointer open];
	
	return dbPointer;
}

+ (void) close{
	if (dbPointer) {
		[dbPointer close];
		dbPointer = NULL;
	}
}
@end
