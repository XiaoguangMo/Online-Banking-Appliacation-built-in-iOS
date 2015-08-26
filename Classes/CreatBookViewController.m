    //
//  CreatBookViewController.m
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CreatBookViewController.h"
#import "Book.h"


@implementation CreatBookViewController


- (void) viewDidLoad{
	
	NSLog(@"Create table");
	self.view.backgroundColor = [UIColor whiteColor];
	self.view.frame = CGRectMake(0, 0, 320, 480);
		
	UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
	bar.barStyle = UIBarStyleBlackOpaque;
	
	UIBarButtonItem *creatButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonSystemItemDone target:self action:@selector(doCreate)];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(doBack)];
	
	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"New Book"];
	
	item.rightBarButtonItem = creatButton;
	item.leftBarButtonItem = backButton;
	[bar pushNavigationItem:item animated:NO];  


	UILabel *idLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 20)];
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 80, 20)];
	UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 80, 20)];
	UILabel *publishHouseLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 120, 20)];
	UILabel *briefIntroducationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 80, 20)];
	UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 80, 20)];
	
	idLabel.text = @"图书ID:";
	nameLabel.text = @"图书名字:";
	authorLabel.text = @"作者:";
	publishHouseLabel.text = @"出版社名字:";
	briefIntroducationLabel.text = @"图书简介:";
	dateLabel.text = @"出版日期:";
	
	idTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 55, 150, 20)];
	idTF.borderStyle = UITextBorderStyleLine;
	nameTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 85, 150, 20)];
	nameTF.borderStyle = UITextBorderStyleLine;
	authorTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 115, 150, 20)];
	authorTF.borderStyle = UITextBorderStyleLine;
	publishTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 145, 150, 20)];
	publishTF.borderStyle = UITextBorderStyleLine;
	briefIntroducationTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 175, 150, 20)];
	briefIntroducationTF.borderStyle = UITextBorderStyleLine;
	dateTF = [[UITextField alloc] initWithFrame:CGRectMake(120, 205, 150, 20)];
	dateTF.borderStyle = UITextBorderStyleLine;
	
	[self.view addSubview:idLabel];
	[self.view addSubview:nameLabel];
	[self.view addSubview:authorLabel];
	[self.view addSubview:publishHouseLabel];
	[self.view addSubview:briefIntroducationLabel];
	[self.view addSubview:dateLabel];
	
	[self.view addSubview:idTF];
	[self.view addSubview:nameTF];
	[self.view addSubview:authorTF];
	[self.view addSubview:publishTF];
	[self.view addSubview:briefIntroducationTF];
	[self.view addSubview:dateTF];
	
	[self.view addSubview:bar];	
}


- (void) doCreate {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定创建？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
	[alert show];
	
	[alert release];
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	if (buttonIndex == 0) {
		BOOL result = [Book createWithID:idTF.text name:nameTF.text publishHouse:publishTF.text author:authorTF.text briefIntroducation:briefIntroducationTF.text  date:dateTF.text];
		if (result) {
			[self dismissModalViewControllerAnimated:YES];
		}
		else {
			NSLog(@"We meet an error, code:%d", result);
		}
	}
	else {
		NSLog(@"you have cancled the new book");
	}
}


- (void) doBack{
	[self dismissModalViewControllerAnimated:YES];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
