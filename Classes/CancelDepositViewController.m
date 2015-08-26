//
//  CancelDepositViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-12-9.
//
//

#import "CancelDepositViewController.h"
#import "DataBase.h"
#import "ViewController.h"
#import "SetDepositDetailViewController.h"
#import "CancelDepositDetailViewController.h"

@interface CancelDepositViewController ()

@end

@implementation CancelDepositViewController
@synthesize user;
@synthesize account;

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
    array2=[[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@' and type = 2",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *findaccount = [rs objectForColumn:@"aid"];
        [array addObject:findaccount];
	}
    NSLog(@"%@",array);
    account = [array objectAtIndex:0];
    [rs close];
    account=[array objectAtIndex:0];
//    for (int i=0; i<[array count]; i++) {
//        PLSqliteDatabase *dataBase = [DataBase setup];
//        id<PLResultSet> rs2;
//        NSString *finddepositSql = [NSString stringWithFormat:@"select * FROM deposit WHERE aid = '%@'",array[i]];
//        rs2 = [dataBase executeQuery:finddepositSql];
//        while ([rs next]) {
//            NSString *findaccount = [rs objectForColumn:@"aid"];
//            NSString *time = [rs objectForColumn:@"savetime"];
//            [array2 addObject:findaccount];
//            [array2 addObject:time];
//        }
//        [rs2 close];
//        NSLog(@"%@",array2);
//    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Back:(id)sender{
    DepositViewController *depositview = [[DepositViewController alloc]init];
    depositview.user=self.user;
//    [self presentModalViewController:depositview animated:NO];
    [self presentViewController:depositview animated:UIViewAnimationCurveEaseOut completion:nil];

}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
//    [self presentModalViewController:login animated:NO];
    [self presentViewController:login animated:UIViewAnimationCurveEaseOut completion:nil];

}

-(IBAction)Selete:(id)sender{
    CancelDepositDetailViewController *canceldetail = [[CancelDepositDetailViewController alloc]init];
    NSLog(@"hello");
    canceldetail.user=self.user;
    canceldetail.account=self.account;
//    [self presentModalViewController:canceldetail animated:NO];
    [self presentViewController:canceldetail animated:UIViewAnimationCurveEaseOut completion:nil];

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
