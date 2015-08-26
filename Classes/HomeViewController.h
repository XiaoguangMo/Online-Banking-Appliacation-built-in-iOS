//
//  HomeViewController.h
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CreatBookViewController;
@class DetailViewController;
@class Book;
@class FavBook;

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	
	UITableView *booksTableView;
	CreatBookViewController *creatBookViewController;
	DetailViewController *detailViewController;
	
	NSMutableArray *booksArray;
	Book *detailBook;
	Book *favBook;
}

@property (nonatomic, retain) Book *detailBook;

@end
