//
//  CreatBookViewController.h
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreatBookViewController : UIViewController<UIAlertViewDelegate> {
	
	UITextField *idTF;
	UITextField *nameTF;
	UITextField *authorTF;
	UITextField *publishTF;
	UITextField *briefIntroducationTF;
	UITextField *dateTF;

}

@end
