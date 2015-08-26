//
//  MainViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-19.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "MainViewController.h"
#import "DataBase.h"

@interface MainViewController ()

@end

@implementation MainViewController
//@synthesize label;
@synthesize user;
@synthesize timearray;
@synthesize fromcurrency;
@synthesize fromaccount;
@synthesize balance2;

-(IBAction)Balance:(id)sender{
    BalanceViewController *balance = [[BalanceViewController alloc]init];
    balance.user=self.user;
    [self presentModalViewController:balance animated:NO];
}

-(IBAction)Memo:(id)sender{
    NSMutableArray *output = [[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSString *findSql = [NSString stringWithFormat:@"select * FROM memo"];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *savetime = [rs objectForColumn:@"time"];
        NSString *accountfrom = [rs objectForColumn:@"aid"];
        NSString *accountto = [rs objectForColumn:@"to"];
        NSString *type = [rs objectForColumn:@"type"];
        NSString *balance = [rs objectForColumn:@"balance"];
        NSRange range1 = NSMakeRange(0, 4);
        NSRange range2 = NSMakeRange(4, 2);
        NSRange range3 = NSMakeRange(6, 2);
        NSRange range4 = NSMakeRange(8, 2);
        NSRange range5 = NSMakeRange(10, 2);
        NSRange range6 = NSMakeRange(12, 2);
        
        NSString *subString1 = [savetime substringWithRange:range1]; //会放生越界错误
        NSString *subString2 = [savetime substringWithRange:range2]; //会放生越界错误
        NSString *subString3 = [savetime substringWithRange:range3];   //@"12345“
        NSString *subString4 = [savetime substringWithRange:range4];   //@"2345”
        NSString *subString5 = [savetime substringWithRange:range5];   //@"”
        NSString *subString6 = [savetime substringWithRange:range6];   //@"5”
        savetime=[NSString stringWithFormat:@"year:%@ month:%@ day:%@ %@: %@: %@",subString1,subString2,subString3,subString4,subString5,subString6];
        [output addObject:accountfrom];
        [output addObject:accountto];
        [output addObject:type];
        [output addObject:savetime];
        [output addObject:balance];
	}
    [rs close];
    NSMutableArray *final=[[NSMutableArray alloc]init];
    for (int i=0; i<[output count];) {
        [final addObject:[NSString stringWithFormat:@"Memo %d :\nAccount %@ transfer %@ to %@ at %@. Transfer type: %@\n",(i+5)/5,output[i],output[i+4],output[i+1],output[i+3],output[i+2]]];
        i=i+5;
    }
    NSString * Str = [NSString stringWithFormat:@""];
    for (int i = 0; i < [final count] ; i ++ ) {
        Str  = [Str stringByAppendingString:[final objectAtIndex:i]];
    }
    //    NSString *message = [NSString stringWithFormat:@"Account %@ transfer %@ to %@ at %@. Transfer type: %@",accountfrom,balance,accountto,savetime,type];
    //    NSLog(@"%@",output[0]);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                   message:Str
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

-(IBAction)History:(id)sender{
    HistoryViewController *history = [[HistoryViewController alloc]init];
    history.user=self.user;
//    [self presentModalViewController:history animated:NO];
    [self presentViewController:history animated:UIViewAnimationCurveEaseOut completion:nil];

}

-(IBAction)Transfer:(id)sender{
    TransferViewController *transfer = [[TransferViewController alloc]init];
    transfer.user=self.user;
//    [self presentModalViewController:transfer animated:NO];
    [self presentViewController:transfer animated:UIViewAnimationCurveEaseInOut completion:nil];

}


-(IBAction)Maintain:(id)sender{
    MaintainViewController *maintain = [[MaintainViewController alloc]init];
    maintain.user=self.user;
//    [self presentModalViewController:maintain animated:NO];
    [self presentViewController:maintain animated:UIViewAnimationCurveEaseIn completion:nil];

}

-(IBAction)Deposit:(id)sender{
    DepositViewController *deposit = [[DepositViewController alloc]init];
    deposit.user=self.user;
//    [self presentModalViewController:deposit animated:NO];
    [self presentViewController:deposit animated:UIViewAnimationCurveLinear completion:nil];

}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
//    [self presentModalViewController:login animated:NO];
    [self presentViewController:login animated:UIViewAnimationOptionCurveLinear completion:nil];

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
    period2=[[NSString alloc]init];
    timearray = [[NSMutableArray alloc]init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSString *year = [NSString stringWithFormat:@"%d",[comps year]];
    //                    NSInteger year = [comps year];
    NSString *month = [NSString stringWithFormat:@"%d",[comps month]];
    NSString *day = [NSString stringWithFormat:@"%d",[comps day]];
    NSString *hour = [NSString stringWithFormat:@"%d",[comps hour]];
    NSString *min = [NSString stringWithFormat:@"%d",[comps minute]];
    NSString *sec = [NSString stringWithFormat:@"%d",[comps second]];
    //                    NSInteger month = [comps month];
    //                    NSInteger day = [comps day];
    //                    NSInteger hour = [comps hour];
    //                    NSInteger min = [comps minute];
    //                    NSInteger sec = [comps second];
    //                    NSString *year1 = @"%d",*year;
    if (month.length==1) {
        month=[NSString stringWithFormat:@"0%d",[comps month]];
    }
    if (day.length==1) {
        day=[NSString stringWithFormat:@"0%d",[comps day]];
    }
    if (hour.length==1) {
        hour=[NSString stringWithFormat:@"0%d",[comps hour]];
    }else if(hour.length==0) {
        hour=[NSString stringWithFormat:@"00"];
    }
    if (min.length==1) {
        min=[NSString stringWithFormat:@"0%d",[comps minute]];
    }else if(min.length==0) {
        min=[NSString stringWithFormat:@"00"];
    }
    if (sec.length==1) {
        sec=[NSString stringWithFormat:@"0%d",[comps second]];
    }else if(sec.length==0) {
        sec=[NSString stringWithFormat:@"00"];
    }
    NSString *savetime = [NSString stringWithFormat:@"%@%@%@",year,month,day];
    int savetime2 = [savetime intValue];
    NSLog(@"%d",savetime2);
    
    PLSqliteDatabase *dataBase = [DataBase setup];
    id<PLResultSet> rs;
    NSString *cancel = [NSString stringWithFormat:@"select * FROM deposit"];
    rs = [dataBase executeQuery:cancel];
    while ([rs next]) {
        NSString *time=[rs objectForColumn:@"savetime"];
        NSString *aid=[rs objectForColumn:@"aid"];
        NSString *period=[rs objectForColumn:@"period"];
        NSString *subString = [time substringWithRange:NSMakeRange(0, 8)];
        NSLog(@"%@",subString);
        int intsub = [subString intValue];
        int intperiod = [period intValue];
        if (savetime2>(intsub+(intperiod*100))) {
            [timearray addObject:aid];
            [timearray addObject:time];
        }
    }
    [rs close];
    for (int i=0; i<[timearray count]; i=i+2) {
        PLSqliteDatabase *dataBase = [DataBase setup];
        
        id<PLResultSet> rs3;
        NSString *store = [NSString stringWithFormat:@"select * from deposit where savetime = %@ and aid = '%@'",timearray[i+1],timearray[i]];
        rs3 = [dataBase executeQuery:store];
        NSLog(@"1");
        while ([rs3 next]) {
            fromaccount = [rs3 objectForColumn:@"from"];
            fromcurrency = [rs3 objectForColumn:@"fromcurrency"];
            balance2 = [rs3 objectForColumn:@"balance"];
            period2 = [rs3 objectForColumn:@"period"];
        }
        [rs3 close];
        int intersting;
        if ([period2 isEqualToString:@"3"]) {
            intersting=1.026;
        }else if([period2 isEqualToString:@"6"]){
            intersting=1.028;
        }else if ([period2 isEqualToString:@"12"]){
            intersting=1.03;
        }
        if ([fromcurrency isEqualToString:@"RMB"]) {
            PLSqliteDatabase *database2 = [DataBase setup];
            id<PLResultSet> rs4;
            //            NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance + %d where aid = '%@'",[balance intValue],fromaccount];
            rs4 = [database2 executeQuery:[NSString stringWithFormat:@"update saving set balance = balance + %d where aid = '%@'",[balance2 intValue],fromaccount]];
            while ([rs4 next]) {
                NSLog(@"update");
            }
            [rs4 close];
        }
        else if([fromcurrency isEqualToString:@"US"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set US = US + %d where aid = '%@'",[balance2 intValue]*intersting,fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }else if([fromcurrency isEqualToString:@"EU"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set EU = EU + %d where aid = '%@'",[balance2 intValue]*intersting,fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }else if([fromcurrency isEqualToString:@"HK"])
        {
            NSLog(@"3");
            id<PLResultSet> rs5;
            NSString *updateSql2 = [NSString stringWithFormat:@"update for set HK = HK + %d where aid = '%@'",[balance2 intValue]*intersting,fromaccount];
            rs5 = [dataBase executeQuery:updateSql2];
            while ([rs5 next]) {
                NSLog(@"update");
            }
            [rs5 close];
        }
        
        
        
        id<PLResultSet> rs;
        NSString *cancel = [NSString stringWithFormat:@"delete FROM deposit WHERE savetime = '%@'",timearray[i+1]];
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
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
