//
//  BookManageAppDelegate.m
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "BookManageAppDelegate.h"
#import "HomeViewController.h"
#import "FavViewController.h"
#import "SearchViewController.h"
#import "ViewController.h"

@implementation BookManageAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //    NSString *gameSqlitePath =[[NSBundle mainBundle] pathForResource:@"vocabulary" ofType:@"db"];
    //    database = [FMDatabase databaseWithPath:gameSqlitePath];
    //    PLSqliteDatabase *dataBase = [DataBase setup];
//    [self CopyDataBaseFile];
    //    [self.db opendb];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {  
//	[application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];	
//	
//	NSMutableArray *controllerArray = [[NSMutableArray alloc] init];
//	
//	homeViewController = [[HomeViewController alloc] init];
//	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
//	navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
//	
//	[controllerArray addObject:navController];
//	
//	FavViewController *favViewController = [[FavViewController alloc] init];
//	UINavigationController *_navController = [[UINavigationController alloc] initWithRootViewController:favViewController];
//	_navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
//	[controllerArray addObject:_navController];
//	
//	SearchViewController *searchViewController = [[SearchViewController alloc] init];
//	[controllerArray addObject:searchViewController];
//	
//	UITabBarController *tabBarController = [[UITabBarController alloc] init];
//	[tabBarController setViewControllers:controllerArray];
//	
//    [window makeKeyAndVisible];
//	[window addSubview:tabBarController.view];
//	
//	return YES;
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
