//
//  FavBook.h
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FavBook : NSObject {

	NSString * _id;
	NSString *_name;
	NSString *_publishHouse;
	NSString *_author;
	NSString *_briefIntroducation;
	NSString * _date;
}

//书籍的方法
+ (NSArray *) findAll;
+ (int) createWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date;
+ (int) delete:(NSString *) ID;

- (id) initWithID:(NSString *) ID name:(NSString *) name publishHouse:(NSString *) publishHouse author:(NSString *) author briefIntroducation:(NSString *)briefIntroducation  date:(NSString *) date;

- (NSString *) ID;
- (NSString *) name;
- (NSString *) publishHouse;
- (NSString *) author;
- (NSString *) briefIntroducation;
- (NSString *) date; 

@end
