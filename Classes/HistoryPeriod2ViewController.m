//
//  HistoryPeriod2ViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-12-9.
//
//

#import "HistoryPeriod2ViewController.h"
#import "ViewController.h"
#import "DataBase.h"
#import "HistoryPeriodViewController.h"

@interface HistoryPeriod2ViewController ()

@end

@implementation HistoryPeriod2ViewController
@synthesize user;
@synthesize account;
@synthesize datepicker;
@synthesize datebegin;
@synthesize dateend;
@synthesize output;


-(IBAction)Selete:(id)sender{
    NSDate *selected = [datepicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    NSString *year = [selected ]
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    dateend = [dateFormatter stringFromDate:selected];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSLog(@"%@",account);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM memo WHERE aid = '%@'",account];
	rs = [dataBase executeQuery:findSql];
    NSLog(@"%@",findSql);
    NSString *zero = @"000000";
    NSLog(@"zero: %@",zero);
    NSString *start1=[datebegin stringByAppendingString:zero];
    NSString *end1=[dateend stringByAppendingString:zero];
    NSLog(@"first: %@     %@",start1,end1);
    double starttime = [start1 doubleValue];
    double endtime = [end1 doubleValue];
//    double doublesavetime = 
    NSLog(@"start %@ end %@",datebegin,dateend);
    NSLog(@"start %f end %f",starttime,endtime);
	while ([rs next]) {
        NSString *savetime = [rs objectForColumn:@"time"];
        NSString *accountfrom = [rs objectForColumn:@"aid"];
        NSString *accountto = [rs objectForColumn:@"to"];
        NSString *type = [rs objectForColumn:@"type"];
        NSString *balance = [rs objectForColumn:@"balance"];
        double intsavetime = [savetime doubleValue];
        NSLog(@"%@",savetime);
        NSLog(@"%d",savetime.length);
        NSRange range1 = NSMakeRange(0, 4);
        NSRange range2 = NSMakeRange(4, 2);
        NSRange range3 = NSMakeRange(6, 2);
        NSRange range4 = NSMakeRange(8, 2);
        NSRange range5 = NSMakeRange(10, 2);
        NSRange range6 = NSMakeRange(12, 2);
        
        NSString *subString1 = [savetime substringWithRange:range1]; //会放生越界错误
        NSLog(@"%@",subString1);
        NSString *subString2 = [savetime substringWithRange:range2]; //会放生越界错误
        NSString *subString3 = [savetime substringWithRange:range3];   //@"12345“
        NSString *subString4 = [savetime substringWithRange:range4];   //@"2345”
        NSString *subString5 = [savetime substringWithRange:range5];   //@"”
        NSString *subString6 = [savetime substringWithRange:range6];   //@"5”
        savetime=[NSString stringWithFormat:@"year:%@ month:%@ day:%@ %@: %@: %@",subString1,subString2,subString3,subString4,subString5,subString6];
        NSLog(@"find");
        NSLog(@"start %f, end %f, now %f",starttime,endtime,intsavetime);
        if ((intsavetime>starttime)&&(intsavetime<endtime)) {
            [output addObject:accountfrom];
            [output addObject:accountto];
            [output addObject:type];
            [output addObject:savetime];
            [output addObject:balance];
            NSLog(@"add");
        }
	}
    [rs close];
    NSMutableArray *final=[[NSMutableArray alloc]init];
    for (int i=0; i<[output count];) {
        [final addObject:[NSString stringWithFormat:@"Account %@ transfer %@ to %@ at %@. Transfer type: %@\n",output[i],output[i+4],output[i+1],output[i+3],output[i+2]]];
        i=i+5;
    }
    NSString * Str = [NSString stringWithFormat:@""];
    
    for (int  i = 0; i < [final count] ; i ++ ) {
        Str  = [Str stringByAppendingString:[final objectAtIndex:i]];
    }
//    NSString *message = [NSString stringWithFormat:@"Account %@ transfer %@ to %@ at %@. Transfer type: %@",accountfrom,balance,accountto,savetime,type];
//    NSLog(@"%@",output[0]);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"History"
                                                   message:Str
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

-(IBAction)Back:(id)sender{
    HistoryPeriodViewController *history = [[HistoryPeriodViewController alloc]init];
    history.user=self.user;
    history.datebegin=self.datebegin;
    history.account=self.account;
    [self presentModalViewController:history animated:NO];
}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
    [self presentModalViewController:login animated:NO];
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
    output = [[NSMutableArray alloc]init];
    NSDate *now = [NSDate date];
    [datepicker setDate:now animated:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
//    [datepicker release];
//    [super dealloc];
}
@end
