//
//  CancelDepositDetailViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-12-9.
//
//

#import "CancelDepositDetailViewController.h"
#import "DataBase.h"
#import "CancelDepositViewController.h"
#import "ViewController.h"

@interface CancelDepositDetailViewController ()

@end

@implementation CancelDepositDetailViewController
@synthesize account;
@synthesize user;
@synthesize time;
@synthesize fromcurrency;
@synthesize fromaccount;
@synthesize balance;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
//        NSString *fromaccount;
//        NSString *fromcurrency;
//        NSString *balance;
        
        PLSqliteDatabase *dataBase = [DataBase setup];
        
        id<PLResultSet> rs3;
        NSString *store = [NSString stringWithFormat:@"select * from deposit where savetime = %@ ",time];
        rs3 = [dataBase executeQuery:store];
        NSLog(@"1");
        while ([rs3 next]) {
            fromaccount = [rs3 objectForColumn:@"from"];
            fromcurrency = [rs3 objectForColumn:@"fromcurrency"];
            balance = [rs3 objectForColumn:@"balance"];
        }
        [rs3 close];
        NSLog(@"2");
        NSLog(@"%@",fromaccount);
        NSLog(@"%@",balance);
        NSLog(@"%d",[balance intValue]);
        NSLog(@"%@",fromcurrency);
        if ([fromcurrency isEqualToString:@"RMB"]) {
            PLSqliteDatabase *database2 = [DataBase setup];
            id<PLResultSet> rs4;
//            NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance + %d where aid = '%@'",[balance intValue],fromaccount];
            rs4 = [database2 executeQuery:[NSString stringWithFormat:@"update saving set balance = balance + %d where aid = '%@'",[balance intValue],fromaccount]];
            while ([rs4 next]) {
                NSLog(@"update");
            }
            [rs4 close];
        }
        else if([fromcurrency isEqualToString:@"US"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set US = US + %d where aid = '%@'",[balance intValue],fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }else if([fromcurrency isEqualToString:@"EU"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set EU = EU + %d where aid = '%@'",[balance intValue],fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }else if([fromcurrency isEqualToString:@"HK"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set HK = HK + %d where aid = '%@'",[balance intValue],fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }
        
        
        
        id<PLResultSet> rs;
        NSString *cancel = [NSString stringWithFormat:@"delete FROM deposit WHERE savetime = '%@'",time];
        rs = [dataBase executeQuery:cancel];
//        NSLog(@"%@",cancel);
//        NSLog(@"delete");
//        NSLog(@"%@",time);
        while ([rs next]) {
            NSLog(@"delete");
        }
        //    NSLog(@"%@",array);
        //    [array removeObject:time];
        //    NSLog(@"%@",array);
        [rs close];
        
        
//        id<PLResultSet> rs2;
//        NSString *increase = [NSString stringWithFormat:@"update FROM deposit WHERE savetime = '%@'",time];
//        rs2 = [dataBase executeQuery:increase];
//        //        NSLog(@"%@",cancel);
//        //        NSLog(@"delete");
//        //        NSLog(@"%@",time);
//        while ([rs2 next]) {
//            NSLog(@"delete");
//        }
//        //    NSLog(@"%@",array);
//        //    [array removeObject:time];
//        //    NSLog(@"%@",array);
//        [rs2 close];
        
        
        [picker reloadAllComponents];
        [picker reloadInputViews];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                       message:@"Cancel successfully"
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }
}

-(IBAction)Cancel:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                   message:@"You will cancel your time deposit!\nYou will lose all the interest! Do you still want to cancel the time deposit?"
                                                  delegate:self
                                         cancelButtonTitle:@"YES"
                                         otherButtonTitles:@"NO", nil];
    [alert show];
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
    fromaccount = [[NSString alloc]init];
    fromcurrency = [[NSString alloc]init];
    balance = [[NSString alloc]init];
    array=[[NSMutableArray alloc]init];
//    array2=[[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSString *findSql = [NSString stringWithFormat:@"select * FROM deposit WHERE aid = '%@'",account];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *findaccount = [rs objectForColumn:@"savetime"];
        [array addObject:findaccount];
	}
    NSLog(@"%@",array);
    [rs close];
    time=[array objectAtIndex:0];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Back:(id)sender{
    CancelDepositViewController *cancel = [[CancelDepositViewController alloc]init];
    cancel.user=self.user;
    cancel.account=self.account;
//    [self presentModalViewController:cancel animated:NO];
    [self presentViewController:cancel animated:UIViewAnimationCurveEaseOut completion:nil];

}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
//    [self presentModalViewController:login animated:NO];
    [self presentViewController:login animated:UIViewAnimationCurveEaseOut completion:nil];

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
    time=[array objectAtIndex:row];
//    account = [array objectAtIndex:row];
}

@end
