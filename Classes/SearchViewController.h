//
//  SearchViewController.h
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController : UIViewController {
	
	NSString *webString;
	
	UILabel *urlLabel;
	UIButton *button;
	UITextView *webtextView;
	UITextField *webTF;
	
	UIWebView *webView;
	NSMutableData *mutableData;
	
	UIImageView *imageView;

}

@end
