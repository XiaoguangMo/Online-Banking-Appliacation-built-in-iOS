//
//  HistoryPeriodViewController.m
//  BookManage
//
//  Created by NNNO on 12-12-5.
//
//

#import "HistoryPeriodViewController.h"
#import "MainViewController.h"
#import "HistoryPeriod2ViewController.h"

@interface HistoryPeriodViewController ()

@end

@implementation HistoryPeriodViewController
@synthesize user;
@synthesize account;
@synthesize datepicker;
@synthesize datebegin;

-(IBAction)Selete:(id)sender{
    NSDate *selected = [datepicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    NSString *year = [selected ]
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    datebegin = [dateFormatter stringFromDate:selected];
    HistoryPeriod2ViewController *history = [[HistoryPeriod2ViewController alloc]init];
    history.user=self.user;
    history.datebegin=self.datebegin;
    history.account=self.account;
    [self presentModalViewController:history animated:NO];
}

-(IBAction)Back:(id)sender{
    MainViewController *main = [[MainViewController alloc]init];
    main.user=self.user;
    [self presentModalViewController:main animated:NO];
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
