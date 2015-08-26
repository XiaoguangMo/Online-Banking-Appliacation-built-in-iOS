    //
//  SearchViewController.m
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"


@implementation SearchViewController


- (id) init{
	if (self = [super init]) {
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"搜索";
		self.tabBarItem.image = [UIImage imageNamed:@"search.png"];
	}
	return self;
}

- (void) viewDidLoad{
	
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 220, 220)];
	
	UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	[control addTarget:self action:@selector(lostKeyboard) forControlEvents:UIControlEventTouchDown];
	self.view = control;
	
	webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 220, 320, 300)];
	
	urlLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 40, 40)];
	urlLabel.text = @"URL:";
	
	webTF = [[UITextField alloc] initWithFrame:CGRectMake(50, 20, 210, 40)];
	webTF.borderStyle = UITextBorderStyleRoundedRect;
	webTF.keyboardAppearance = UIKeyboardAppearanceAlert;
	
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(270, 20, 40, 40);
	[button setTitle:@"Go" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(doGo) forControlEvents:UIControlEventTouchUpInside];
	
	webtextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 70, 315, 170)];
	webtextView.backgroundColor = [UIColor yellowColor];
	
	[self.view addSubview:urlLabel];
	[self.view addSubview:webTF];
	[self.view addSubview:button];
	[self.view addSubview:imageView];
//	[self.view addSubview:webtextView];
//	[self.view addSubview:webView];
}


- (void) lostKeyboard{
	[webtextView resignFirstResponder];
	[webTF resignFirstResponder];
}


- (void) doGo{
	
	[webTF resignFirstResponder];

	//urlString = textFiled.text;
	//NSURL *url=[NSURL URLWithString:urlString];
	NSURL *url=[NSURL URLWithString:@"http://demo.gnway.com:8000/Icons/5.ico"];
	NSData *data=[NSData dataWithContentsOfURL:url];
	UIImage *tmpimage=[[UIImage alloc] initWithData:data];
//	UIImage *image = [[UIImage alloc] initWithData:<#(NSData *)data#>];
	[imageView setImage:tmpimage];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [mutableData setLength:0];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSLog(@"receive data : %d",[data length]);
    [mutableData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSData *urlData = mutableData;
	
	NSString *responseString = [[NSString alloc] initWithData:urlData encoding: CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
	
	//	NSRange range1 = [responseString rangeOfString: @"<title>"];
	//    NSRange range2 = [responseString rangeOfString: @"</title>"];
	//    NSRange range3 = {range1.location + range1.length, range2.location - range1.location - range1.length };
	
	//    NSLog(@"Title is '%@'", [responseString substringWithRange: range3]);
	webtextView.text = responseString;
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
