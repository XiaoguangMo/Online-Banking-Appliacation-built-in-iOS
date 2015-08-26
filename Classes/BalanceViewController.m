//
//  BalanceViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "BalanceViewController.h"
#import "ViewController.h"
#import "DataBase.h"

@interface BalanceViewController ()

@end

@implementation BalanceViewController
//@synthesize label;
@synthesize user;
@synthesize array;
@synthesize picker;
@synthesize aid;
@synthesize atype;

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSString  *result = [array objectAtIndex:row*3+2];
//    label.text = result;
    aid=[array objectAtIndex:row*3];
    atype=[array objectAtIndex:row*3+1];
    NSLog(@"aid%@",aid);
    NSLog(@"atype%@",atype);
}
-(IBAction)check:(id)sender{
    if ([atype isEqualToString:@"1"]) {
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSLog(@"%@",user);
        NSString *findSql = [NSString stringWithFormat:@"select * FROM saving WHERE aid = '%@'",aid];
        rs = [dataBase executeQuery:findSql];
        while ([rs next]) {
            NSString *balance = [rs objectForColumn:@"balance"];
            NSString *output = [NSString stringWithFormat:@"Your saving account balance is %@",balance];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                           message:output
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        [rs close];
    }else if ([atype isEqualToString:@"3"]){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
//        NSLog(@"%@",user);
        NSString *findSql = [NSString stringWithFormat:@"select * FROM FOR where aid = '%@'",aid];
//        NSString *findSql = [NSString stringWithFormat:@"select * FROM foreign WHERE aid = '%@'",aid];

        NSLog(@"%@",aid);
        rs = [dataBase executeQuery:findSql];
        while ([rs next]) {
//            NSLog(@"ok");
            NSString *US = [rs objectForColumn:@"US"];
            NSString *EU = [rs objectForColumn:@"EU"];
            NSString *HK = [rs objectForColumn:@"HK"];
            NSString *output = [NSString stringWithFormat:@"Your foreign currency account balance is\nUS dollar :%@\nEuro :%@\nHong Kong dollar :%@",US,EU,HK];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                           message:output
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        [rs close];
    }else{
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        //        NSLog(@"%@",user);
        NSString *findSql = [NSString stringWithFormat:@"select * FROM deposit where aid = '%@'",aid];
        rs = [dataBase executeQuery:findSql];
        NSMutableArray *output=[[NSMutableArray alloc]init];
        while ([rs next]) {
            NSString *balance = [rs objectForColumn:@"balance"];
            NSString *period = [rs objectForColumn:@"period"];
            NSString *savetime = [rs objectForColumn:@"savetime"];
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
            savetime=[NSString stringWithFormat:@"%@/%@/%@ %@: %@: %@",subString1,subString2,subString3,subString4,subString5,subString6];
            [output addObject:balance];
            [output addObject:period];
            [output addObject:savetime];
        }
        NSMutableArray *final=[[NSMutableArray alloc]init];
        for (int i=0; i<[output count];) {
            [final addObject:[NSString stringWithFormat:@"Balance %@ saved in %@ with period %@ month\n",output[i],output[i+2],output[i+1]]];
            i=i+3;
        }
        NSString * Str = [NSString stringWithFormat:@""];
        
        for (int  i = 0; i < [final count] ; i ++ ) {
            Str  = [Str stringByAppendingString:[final objectAtIndex:i]];
        }
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                       message:Str
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        [rs close];
    }
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

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [array count]/3;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [array objectAtIndex:(row*3+2)];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
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
    aid=[[NSString alloc]init];
    atype=[[NSString alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSLog(@"%@",user);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@'",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *account = [rs objectForColumn:@"aid"];
        NSString *type = [rs objectForColumn:@"type"];
        NSString *final;
        if ([type isEqualToString:@"1"]) {
            final=[NSString stringWithFormat:@"%@Saving",account];
        }else if([type isEqualToString:@"2"]){
            final=[NSString stringWithFormat:@"%@TimeDe",account];
        }else{
            final=[NSString stringWithFormat:@"%@Foreign",account];
        }
        [array addObject:account];
        [array addObject:type];
        [array addObject:final];
//        NSLog(@"array:%@",array);
//        label.text=[array objectAtIndex:2];
	}
    [rs close];
    aid=[array objectAtIndex:0];
    atype=[array objectAtIndex:1];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
