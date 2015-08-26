    //
//  HomeViewController.m
//  BookManage
//
//  Created by WangChao on 10-10-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "CreatBookViewController.h"
#import "DetailViewController.h"
#import "Book.h"


@implementation HomeViewController

@synthesize detailBook;

- (id) init{
if (self = [super init]) {
	self.view.frame = CGRectMake(0, 49, 320, 431);
	self.title = @"主页";
	self.navigationItem.title = @"图书管理";
	self.tabBarItem.image = [UIImage imageNamed:@"home.png"];
//	self.tabBarItem  = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];	
		
	creatBookViewController = [[CreatBookViewController alloc] init];
	detailViewController = [[DetailViewController alloc] init];
	
	booksArray = [[NSMutableArray alloc] init];
}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	UIBarButtonItem *creatButton = [[UIBarButtonItem alloc] initWithTitle:@"增加" style:UIBarButtonSystemItemAdd target:self action:@selector(doCreate)];
	
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonSystemItemAdd target:self action:@selector(doEdit)];
	
	[self.navigationItem setRightBarButtonItem:editButton];
	[self.navigationItem setLeftBarButtonItem:creatButton];
	
	[creatButton release];
//	[editButton release];

	booksTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 49, 320, 380) style:UITableViewStylePlain];
	booksTableView.delegate = self;
	booksTableView.dataSource = self;
	
	[self.view addSubview:booksTableView];
	
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSArray *books = [[NSArray alloc] init];
	books = [Book findAll];
	NSLog(@"%@",books);
	
	[booksArray removeAllObjects];
	for (id book in books) {
		[booksArray addObject:book]; 
	}
	[booksTableView reloadData];
	[books release];
	
}

//Creat Book 和 Detail Book 的方法

- (void) creat{
	[self.navigationController pushViewController:creatBookViewController animated:YES];
}

-(void) doCreate{
	[self presentModalViewController:creatBookViewController animated:YES];
}

- (void) doEdit{
	
	[booksTableView setEditing:!booksTableView.editing animated:YES];
	if(booksTableView.editing)
		self.navigationItem.rightBarButtonItem.title = @"完成";
	else
		self.navigationItem.rightBarButtonItem.title = @"删除";
}



#pragma mark ------ TableView DataSource Method ------


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [booksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"BookTableViewIdentifier";
	UITableViewCell *cell = [booksTableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] autorelease];
	}
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	Book *book = [booksArray objectAtIndex:indexPath.row];
		
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 200, 20)];
	[titleLabel setText:[book name]];
	titleLabel.textAlignment = UITextAlignmentCenter;
	[titleLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
	[titleLabel setNumberOfLines:3];
	[cell.contentView addSubview:titleLabel];
	
	UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 200, 20)];
	NSString *author = [NSString stringWithFormat:@"作者:%@",[book author]];
	[authorLabel setText:author];
	[authorLabel setNumberOfLines:3];
	[cell.contentView addSubview:authorLabel];
	
	UILabel *publishHouseLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 200, 20)];
	NSString *publishHouse = [NSString stringWithFormat:@"出版社:%@",[book publishHouse]];
	[publishHouseLabel setText:publishHouse];
	[cell.contentView addSubview:publishHouseLabel];
	 
	UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 105, 200, 20)];
	NSString *dateText = [NSString stringWithFormat:@"出版日期:%d年",[[book date] intValue]];
	[dateLabel setText:dateText];
	[cell.contentView addSubview:dateLabel];
	
	UILabel *editDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 135, 200, 10)];
	NSString *editDate = [NSString stringWithFormat:@"%@",[NSDate date]];
	[editDateLabel setText:editDate];
	editDateLabel.textAlignment = UITextAlignmentRight;
	[editDateLabel setFont:[UIFont fontWithName:@"Arial" size:10.0f]];
	[cell.contentView addSubview:editDateLabel];

	
	[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
	
	NSLog(@"cell for indexpath");
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}


#pragma mark ------- TableView Delegate Method -----

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 150.f;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	detailBook = [booksArray objectAtIndex:indexPath.row];
	[detailViewController setDetailView:detailBook];
	[self.navigationController pushViewController:detailViewController animated:YES];
	detailViewController.navigationItem.title = [detailBook name];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{	
	Book *book = [booksArray objectAtIndex:indexPath.row];
	[Book delete:[book ID]];
	[booksArray removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}


- (void)dealloc {
    [super dealloc];
}
@end
