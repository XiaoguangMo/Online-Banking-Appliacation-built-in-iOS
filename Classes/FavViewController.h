//
//  FavViewController.h
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FavBook;
@class DetailViewController;


@interface FavViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	
	NSMutableArray *storeArray;
	UITableView *storeTableView;
	FavBook *detailFavBook;
	DetailViewController *_detailViewController;
	NSArray *favBooks;

}


@end
