//
//  HistoryViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "HistoryViewController.h"
#import "MainViewController.h"
#import "DataBase.h"
#import "ViewController.h"
#import "HistoryPeriodViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
@synthesize user;
@synthesize account;

-(IBAction)Back:(id)sender{
    MainViewController *main = [[MainViewController alloc]init];
//    NSLog(@"%@",user);
    main.user=self.user;
    [self presentModalViewController:main animated:NO];
}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
    [self presentModalViewController:login animated:NO];
}

-(IBAction)Selete:(id)sender{
    HistoryPeriodViewController *period = [[HistoryPeriodViewController alloc]init];
    period.user = self.user;
    period.account = self.account;
    [self presentModalViewController:period animated:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    array=[[NSMutableArray alloc]init];
//    array2=[[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@'",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *findaccount = [rs objectForColumn:@"aid"];
        [array addObject:findaccount];
	}
    NSLog(@"%@",array);
    account = [array objectAtIndex:0];
    [rs close];
    account=[array objectAtIndex:0];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [array count];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [array objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    account = [array objectAtIndex:row];
}

@end
