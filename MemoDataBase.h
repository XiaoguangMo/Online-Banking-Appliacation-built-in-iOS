//
//  FavDataBase.h
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PlausibleDatabase/PlausibleDatabase.h>

@interface MemoDataBase : NSObject {
	
}

+ (PLSqliteDatabase *) setup;

+ (void) close;


@end
