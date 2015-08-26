//
//  DetailViewController.h
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Book;
@class FavBook;


@interface DetailViewController : UIViewController<UITextFieldDelegate,UIAccelerometerDelegate,UIAlertViewDelegate> {
	UITextView *detailTextView ;
	UILabel *titleLabel;
	UILabel *authorLabel;
	UIImageView *imageView;
	NSMutableArray *array;
	FavBook *favBook;
	
}

@property (nonatomic, retain) UIImageView *imageView;

- (void) setDetailView:(Book *)book;

@end
