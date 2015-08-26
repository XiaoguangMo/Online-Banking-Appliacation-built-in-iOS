//
//  FavBook.m
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavBook.h"
#import "MemoDataBase.h"


@implementation FavBook

+ (NSArray *) findAll{
	PLSqliteDatabase *dataBase = [MemoDataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:@"SELECT * FROM FavBook"];
	
	//定义一个数组存放所有书籍的信息
	NSMutableArray *favBooks = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到books数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"ID"];
		NSString *name = [rs objectForColumn:@"Name"];
		NSString *author = [rs objectForColumn:@"Author"];
		NSString *publishHouse = [rs objectForColumn:@"PublishHouse"];
		NSString *date = [rs objectForColumn:@"Date"];
		NSString *briefIntroducation = [rs objectForColumn:@"BriefIntroducation"];
		
		
		//初始化book 存放到books里面
		FavBook *favbook = [[FavBook alloc] initWithID:ID name:name publishHouse:publishHouse author:author briefIntroducation:briefIntroducation date:date];
		[favBooks addObject:favbook];
		
		[favbook release];  
	}
	//关闭数据库
	[rs close];
	
	return favBooks;
}

//根据ID搜索相关书籍的方法
//+ (id) find:(NSInteger) ID{
//	PLSqliteDatabase *dataBase = [DataBase setup];
//	
//	id<PLResultSet> rs;
//	
//	NSString *findSql = [NSString stringWithFormat:@"select * FROM Book WHERE ID = %d",ID];
//	rs = [dataBase executeQuery:findSql];
//	
//	Book *book = nil;
//	
//	if([rs next]) {
//		NSString *ID = [rs objectForColumn:@"ID"];
//		NSString *name = [rs objectForColumn:@"Name"];
//		NSString *author = [rs objectForColumn:@"Author"];
//		NSString *publishHouse = [rs objectForColumn:@"PublishHouse"];
//		NSString *date = [rs objectForColumn:@"Date"];
//		NSString *briefIntroducation = [rs objectForColumn:@"BriefIntroducation"];
//		
//		book = [[Book alloc] initWithID:ID name:name publishHouse:publishHouse author:author briefIntroducation:briefIntroducation date:date];
//	}
//	else {
//		UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Can not find!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//		[errorAlert show];
//		NSLog(@"Error!!Can not find.");
//		
//		[errorAlert release];
//	}
//	
//	[rs close];
//	
//	return [book autorelease];	
//}

//查询当前有本书的方法
//+ (int) count{
//	
//	PLSqliteDatabase *dataBase = [DataBase setup];
//	int bookCount = 0;
//	
//	id<PLResultSet>rs;
//	rs = [dataBase executeQuery:@"SELECT COUNT(*) AS BookCount FROM Book"];
//	
//	if ([rs next]) {
//		bookCount = [[rs objectForColumn:@"BookCount"] intValue];
//	}
//	
//	[rs close];
//	
//	return bookCount;
//	
//}
//
//修改某一本书籍的方法
//+ (int) update:(NSString *)ID withName:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date{
//	PLSqliteDatabase *dataBase = [DataBase setup];
//    
//    BOOL bResult = [dataBase executeUpdate: @"UPDATE Book SET name = ?, publishHouse = ?, author = ?, briefIntroducation = ?, date = ?",
//                    ID, 
//                    name, 
//					publishHouse,
//					author,
//                    briefIntroducation,
//					date];
//	
//	return bResult;
//}

//创建新书籍的方法
+ (int) createWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date1{
	PLSqliteDatabase *dataBase = [MemoDataBase setup];
    
    BOOL bResult = [dataBase executeUpdate: @"INSERT INTO FavBook (ID, Name, PublishHouse, Author, BriefIntroducation, Date) VALUES (?,?,?,?,?,?)",
                    ID, 
                    name, 
					publishHouse,
					author,
                    briefIntroducation,
					date1];
	
	return bResult;
}


//删除书籍的方法
+ (int) delete:(NSString *) ID{
	PLSqliteDatabase *favDataBase = [MemoDataBase setup];
	
	BOOL bResult = [favDataBase executeUpdate:@"DELETE FROM FavBook WHERE ID = ?",
					ID];
	
	return bResult;
}


//书籍这个类的初始化方法
- (id) initWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date{
	if (self = [super init]) {
		_id = [ID retain];
		_name = [name retain];
		_publishHouse = [publishHouse retain];
		_author = [author retain];
		_briefIntroducation = [briefIntroducation retain];
		_date = [date retain];
	}
	return self;
}


- (NSString *) ID{
	return _id;
}

- (NSString *) name{
	return _name;
}

- (NSString *) publishHouse{
	return _publishHouse;
}

- (NSString *) author{
	return _author;
}

- (NSString *) briefIntroducation{
	return _briefIntroducation;
}

- (NSString *) date{
	return _date;
}
@end
