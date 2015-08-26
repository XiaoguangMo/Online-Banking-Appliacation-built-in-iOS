//
//  BookManageAppDelegate.h
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeViewController;
@class ViewController;
@interface BookManageAppDelegate : NSObject <UIApplicationDelegate> {
	
	HomeViewController *homeViewController;
    ViewController *viewcontroller;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@end

