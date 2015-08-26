    //
//  FavViewController.m
//  BookManage
//
//  Created by WangChao on 10-11-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavViewController.h"
#import "DetailViewController.h"
#import "FavBook.h"
#import "Book.h"


@implementation FavViewController


- (id) init{
	if (self = [super init]) {
		self.title = @"收藏夹";
		self.tabBarItem.image = [UIImage imageNamed:@"fav.png"];
		
		storeArray = [[NSMutableArray alloc] init];
		_detailViewController = [[DetailViewController alloc] init];
		_detailViewController.view.tag = 2;
	}
	return self;
}


- (void) viewDidLoad{
	storeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 49, 320, 400) style:UITableViewStylePlain];
	storeTableView.delegate = self;
	storeTableView.dataSource = self;
	
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonSystemItemAdd target:self action:@selector(doEdit)];
	self.navigationItem.rightBarButtonItem = editButton;
	
	[self.view addSubview:storeTableView];
	
	NSLog(@"storeArray: %@",storeArray);
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	favBooks = [[NSArray alloc] init];
	favBooks = [FavBook findAll];
	
	[storeArray removeAllObjects];
	for (id book in favBooks) {
		[storeArray addObject:book]; 
	}
	[storeTableView reloadData];
	[favBooks release];
	
}

- (void) doEdit{
	
	[storeTableView setEditing:!storeTableView.editing animated:YES];
	if(storeTableView.editing)
		self.navigationItem.rightBarButtonItem.title = @"完成";
	else
		self.navigationItem.rightBarButtonItem.title = @"删除";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [storeArray count];
	NSLog(@"!!!!!!!!!!!%@",favBooks);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"StoreTableViewIdentifier";
	UITableViewCell *cell = [storeTableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] autorelease];
	}
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	FavBook *favBook = [storeArray objectAtIndex:indexPath.row];
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 200, 20)];
	[titleLabel setText:[favBook name]];
	titleLabel.textAlignment = UITextAlignmentCenter;
	[titleLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
	[titleLabel setNumberOfLines:3];
	[cell.contentView addSubview:titleLabel];
	
	UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 200, 20)];
	NSString *author = [NSString stringWithFormat:@"作者:%@",[favBook author]];
	[authorLabel setText:author];
	[authorLabel setNumberOfLines:3];
	[cell.contentView addSubview:authorLabel];
	
	UILabel *publishHouseLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 200, 20)];
	NSString *publishHouse = [NSString stringWithFormat:@"出版社:%@",[favBook publishHouse]];
	[publishHouseLabel setText:publishHouse];
	[cell.contentView addSubview:publishHouseLabel];
	
	UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 105, 200, 20)];
	NSString *dateText = [NSString stringWithFormat:@"出版日期:%d年",[[favBook date] intValue]];
	[dateLabel setText:dateText];
	[cell.contentView addSubview:dateLabel];
	
	UILabel *editDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 135, 200, 10)];
	NSString *editDate = [NSString stringWithFormat:@"%@",[NSDate date]];
	[editDateLabel setText:editDate];
	editDateLabel.textAlignment = UITextAlignmentRight;
	[editDateLabel setFont:[UIFont fontWithName:@"Arial" size:10.0f]];
	[cell.contentView addSubview:editDateLabel];
	
	
	[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
	
	return cell;
}



#pragma mark ------- TableView Delegate Method -----

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 150.f;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{	
	FavBook *favBook = [storeArray objectAtIndex:indexPath.row];
	[FavBook delete:[favBook ID]];
	[storeArray removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	detailFavBook = [storeArray objectAtIndex:indexPath.row];
	Book *book = [[Book alloc] initWithID:[detailFavBook ID] name:[detailFavBook name] publishHouse:[detailFavBook publishHouse] author:[detailFavBook author] briefIntroducation:[detailFavBook briefIntroducation] date:[detailFavBook date]];	
	[_detailViewController setDetailView:book];
	[self.navigationController pushViewController:_detailViewController animated:YES];
	_detailViewController.navigationItem.title = [detailFavBook name];
	_detailViewController.navigationItem.rightBarButtonItem = nil;
	[book release];
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
	[_detailViewController release];
	[storeArray release];
	[storeTableView release];
}


@end
