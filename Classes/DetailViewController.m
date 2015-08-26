    //
//  DetailViewController.m
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "FavBook.h"
#import "Book.h"


@implementation DetailViewController

@synthesize imageView;

- (id)init {
	
	
	
	NSLog(@"init -=================================================================");
	if (self = [super init]) {
		self.view.backgroundColor = [UIColor whiteColor];
		self.view.frame = CGRectMake(0, 49, 320, 480);
		self.navigationController.navigationBar.barStyle = UIBarStyleBlack; 
		
		NSLog(@"the current tabbar title is : %@",self.tabBarItem.title);
	}
	return self;
}

- (void) viewDidLoad{
	
	NSLog(@"viewDidLoad -=================================================================");

	
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	NSLog(@"the current tabbar title is : %@",self.tabBarItem.title);
	
	//重力感应
	UIAccelerometer *accelermoeter = [UIAccelerometer sharedAccelerometer];
	accelermoeter.delegate = self;
	accelermoeter.updateInterval = (1.0f / 10.0f);
	

	UIBarButtonItem *storeButton = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonSystemItemSave target:self action:@selector(doStore)];
	self.navigationItem.rightBarButtonItem = storeButton;

	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 200, 40)];
	titleLabel.font = [UIFont fontWithName:@"Courier" size:30.f];
	
	authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 100, 170, 40)];
	authorLabel.font = [UIFont fontWithName:@"Courier" size:15.0f];
	
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 100, 130, 200)];
	imageView.image = [UIImage imageNamed:@"image.png"];
	
	detailTextView = [[UITextView alloc] initWithFrame:CGRectMake(140, 140, 170, 160)];
	
	
	[self.view addSubview:scrollView];
	[scrollView addSubview:titleLabel];
	//[self.view addSubview:detailTF];
	[scrollView addSubview:authorLabel];
	[scrollView addSubview:imageView];
	[scrollView addSubview:detailTextView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	
	[textField resignFirstResponder];	
	return YES;
}

- (void) doStore{
	 
	NSLog(@"%@,%@,%@",[favBook ID],[favBook name],[favBook publishHouse]);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定收藏？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil]; 
	[alert show];
	
	[alert release];
}


- (void) setDetailView:(Book *)book{
	titleLabel.text = [book name];
	detailTextView.text = [book briefIntroducation];
	NSString *author = [NSString stringWithFormat:@"作者: %@",[book author]];
	authorLabel.text = author;
	
	favBook = [[FavBook alloc] initWithID:[book ID] name:[book name] publishHouse:[book publishHouse] author:[book author] briefIntroducation:[book briefIntroducation] date:[book date]];
}

#pragma mark ---- UIAlertView Deleagate ----
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 0) {
		[FavBook createWithID:[favBook ID] name:[favBook name] publishHouse:[favBook publishHouse] author:[favBook publishHouse] briefIntroducation:[favBook briefIntroducation]  date:[favBook date]];
		[self.navigationController popViewControllerAnimated:YES];
	}
}

#pragma mark ---- aaccelerometer  delegate Method -------
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
	
	if (acceleration.x > 2.2 || acceleration.y > 2.2 || acceleration.z > 2.2) {
		NSLog(@"- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration");
	}
	
	NSLog(@"- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration");
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
