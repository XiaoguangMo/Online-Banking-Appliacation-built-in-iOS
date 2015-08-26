//
//  Book.h
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Book : NSObject {
	NSString * _id;
	NSString *_name;
	NSString *_publishHouse;
	NSString *_author;
	NSString *_briefIntroducation;
	NSString * _date;
}

//书籍的方法
+ (NSArray *) findAll;
+ (id) find:(NSInteger) ID;
+ (int) count;
+ (int) createWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date;
+ (int) update:(NSString *)ID withName:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date;
+ (int) delete:(NSString *) ID;

- (id) initWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date;

- (NSString *) ID;
- (NSString *) name;
- (NSString *) publishHouse;
- (NSString *) author;
- (NSString *) briefIntroducation;
- (NSString *) date; 

@end
