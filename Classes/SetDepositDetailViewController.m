//
//  SetDepositDetailViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-12-8.
//
//

#import "SetDepositDetailViewController.h"
#import "ViewController.h"
#import "DataBase.h"
#import "DepositViewController.h"

@interface SetDepositDetailViewController ()

@end

@implementation SetDepositDetailViewController
@synthesize picker;
@synthesize user;
@synthesize account;
@synthesize accountto;
@synthesize currency;
//@synthesize deposit;
@synthesize textfield;
@synthesize montharray;
@synthesize period;
//@synthesize interest;
@synthesize array2;
@synthesize currencyto;
@synthesize array;
@synthesize flag;
@synthesize get;

-(IBAction)submit:(id)sender{
    flag=@"0";
    NSScanner* scan = [NSScanner scannerWithString:textfield.text];
    int val;
    //    return[scan scanInt:&val] && [scan isAtEnd];
    //    NSString *warning;
    if (!([scan scanInt:&val] && [scan isAtEnd])) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The amount should be pure integer.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }else{
        NSLog(@"currency:%@",currency);
        if ([currency isEqualToString:@"RMB"]) {
            PLSqliteDatabase *dataBase = [DataBase setup];
            id<PLResultSet> rs;
//            NSLog(@"%@",user);
//            NSLog(@"%@",account);
            NSString *findSql = [NSString stringWithFormat:@"select * FROM saving WHERE aid = '%@'",account];
            rs = [dataBase executeQuery:findSql];
            while ([rs next]) {
//                NSLog(@"rs next");
                NSString *balance = [rs objectForColumn:@"balance"];
                int abalance = [balance intValue];
                int bbalance = [textfield.text intValue];
                if ((abalance-bbalance)<0) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:(@"You don't have enough money.")
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                    [alert show];
                }else{
                    
                    if ([currency isEqualToString:@"RMB"]) {
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"US"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"EU"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"HK"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }
                
                    NSString *alerttext=[NSString stringWithFormat:@"You will set %@ %@ from %@ to %@ for currency %@with period %@ month %@. You will get %@ %@ in total.",textfield.text,account,currency,accountto,currencyto,period,interest,get,currencyto];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:alerttext
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Cancel", nil];
                    [alert show];
                    
                    
                }
            }
            [rs close];
            
        }else if([currency isEqualToString:@"US"]){
            PLSqliteDatabase *dataBase = [DataBase setup];
            id<PLResultSet> rs;
            //            NSLog(@"%@",user);
            //            NSLog(@"%@",account);
            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
            rs = [dataBase executeQuery:findSql];
            while ([rs next]) {
                //                NSLog(@"rs next");
                NSString *balance = [rs objectForColumn:@"US"];
                int abalance = [balance intValue];
                int bbalance = [textfield.text intValue];
                if ((abalance-bbalance)<0) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:(@"You don't have enough money.")
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                    [alert show];
                }else{
                    flag=@"US0";
                    if ([currency isEqualToString:@"RMB"]) {
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"US"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"EU"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"HK"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }
                    
                    NSString *alerttext=[NSString stringWithFormat:@"You will set %@ %@ from %@ to %@ for currency %@with period %@ month %@. You will get %@ %@ in total.",textfield.text,account,currency,accountto,currencyto,period,interest,get,currencyto];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:alerttext
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:@"Cancel", nil];
                    [alert show];
                    
                    
                }
            }
            [rs close];
        }else if([currency isEqualToString:@"EU"]){
            PLSqliteDatabase *dataBase = [DataBase setup];
            id<PLResultSet> rs;
            //            NSLog(@"%@",user);
            //            NSLog(@"%@",account);
            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
            rs = [dataBase executeQuery:findSql];
            while ([rs next]) {
                //                NSLog(@"rs next");
                NSString *balance = [rs objectForColumn:@"EU"];
                int abalance = [balance intValue];
                int bbalance = [textfield.text intValue];
                if ((abalance-bbalance)<0) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:(@"You don't have enough money.")
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                    [alert show];
                }else{
                    flag=@"EU0";
                    if ([currency isEqualToString:@"RMB"]) {
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"US"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"EU"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"HK"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }
                    
                    NSString *alerttext=[NSString stringWithFormat:@"You will set %@ %@ from %@ to %@ for currency %@with period %@ month %@. You will get %@ %@ in total.",textfield.text,account,currency,accountto,currencyto,period,interest,get,currencyto];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:alerttext
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:@"Cancel", nil];
                    [alert show];
                    
                    
                }
            }
            [rs close];
        }else if([currency isEqualToString:@"HK"]){
            PLSqliteDatabase *dataBase = [DataBase setup];
            id<PLResultSet> rs;
            //            NSLog(@"%@",user);
            //            NSLog(@"%@",account);
            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
            rs = [dataBase executeQuery:findSql];
            while ([rs next]) {
                //                NSLog(@"rs next");
                NSString *balance = [rs objectForColumn:@"HK"];
                int abalance = [balance intValue];
                int bbalance = [textfield.text intValue];
                if ((abalance-bbalance)<0) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:(@"You don't have enough money.")
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                    [alert show];
                }else{
                    flag=@"HK0";
                    if ([currency isEqualToString:@"RMB"]) {
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"US"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*6/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"EU"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*8/0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }else if ([currency isEqualToString:@"HK"]){
                        if ([currencyto isEqualToString:@"RMB"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"US"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/6)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"EU"]) {
                            get=[NSString stringWithFormat:@"%f",([textfield.text floatValue]*0.8/8)];
                            get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }else if ([currencyto isEqualToString:@"HK"]) {
                            get=textfield.text;
                            if ([period isEqualToString:@"3"]) {
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.026)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else if([period isEqualToString:@"6"]){
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.028)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }else{
                                get=[NSString stringWithFormat:@"%f",([get floatValue]*1.03)];
                                get=[get substringWithRange:NSMakeRange(0, get.length-4)];
                            }
                        }
                    }
                    
                    NSString *alerttext=[NSString stringWithFormat:@"You will set %@ %@ from %@ to %@ for currency %@with period %@ month %@. You will get %@ %@ in total.",textfield.text,account,currency,accountto,currencyto,period,interest,get,currencyto];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:alerttext
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:@"Cancel", nil];
                    [alert show];
                    
                    
                }
            }
            [rs close];
        }
        
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    NSString* msg = [[NSString alloc] initWithFormat:@"您按下的第%d个按钮！",buttonIndex];
//    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示"
//                                                   message:msg
//                                                  delegate:nil
//                                         cancelButtonTitle:@"确定"
//                                         otherButtonTitles:nil];
//    [alert show];
    PLSqliteDatabase *dataBase = [DataBase setup];
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
    NSString *savetime = [NSString stringWithFormat:@"%@%@%@%@%@%@",year,month,day,hour,min,sec];
    NSLog(@"%@",savetime);
    
    
    if (buttonIndex==0&&[flag isEqualToString:@"1"]) {
        NSLog(@"case 2");
        id<PLResultSet> rs5;
        NSString *customermemoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"RMB set deposit",currencyto,savetime,textfield.text];
        rs5 = [dataBase executeQuery:customermemoSql];
        while ([rs5 next]) {
            NSLog(@"success update");
        }
        [rs5 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,accountto,@"RMB set deposit",currency,currencyto,textfield.text,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",accountto,savetime]];
        [data writeToFile: filename atomically: NO];
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
//        [self presentModalViewController:main animated:NO];
        [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];
    }
    
    if (buttonIndex==0&&[flag isEqualToString:@"0"]) {
        NSLog(@"case 1");
        flag=@"1";
            id<PLResultSet> rs2;
            //                    NSLog(@"rs2");
            NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance - %d where aid = '%@'",[textfield.text intValue],account];
            rs2 = [dataBase executeQuery:updateSql];
            while ([rs2 next]) {
                NSLog(@"success update");
            }
            [rs2 close];
            id<PLResultSet> rs3;
            //                    NSLog(@"rs3");
            
            
            
            NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO deposit VALUES ('%@', '%@', '%@', '%@', '%@' ,'RMB' ,'%@')",accountto,textfield.text,period,savetime,account,currencyto];
            rs3 = [dataBase executeQuery:insertSql];
            while ([rs3 next]) {
                NSLog(@"success update");
            }
            [rs3 close];
            id<PLResultSet> rs4;
            NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"RMB set deposit",currencyto,savetime,textfield.text];
            rs4 = [dataBase executeQuery:memoSql];
            while ([rs4 next]) {
                NSLog(@"success update");
            }
            [rs4 close];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                           message:@"Do you want to save the memo on your iPHone?"
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:@"Cancel", nil];
            [alert show];
    }
    if (buttonIndex==0&&[flag isEqualToString:@"EU1"]) {
        NSLog(@"case 2");
        id<PLResultSet> rs5;
        NSString *customermemoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"EU set deposit",currencyto,savetime,textfield.text];
        rs5 = [dataBase executeQuery:customermemoSql];
        while ([rs5 next]) {
            NSLog(@"success update");
        }
        [rs5 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,accountto,@"EU set deposit",currency,currencyto,textfield.text,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",accountto,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
//        [self presentModalViewController:main animated:NO];
        [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

    }
    
    if (buttonIndex==0&&[flag isEqualToString:@"EU0"]) {
        NSLog(@"case 1");
        flag=@"EU1";
        id<PLResultSet> rs2;
        //                    NSLog(@"rs2");
        NSString *updateSql = [NSString stringWithFormat:@"update for set EU = EU - %d where aid = '%@'",[textfield.text intValue],account];
        rs2 = [dataBase executeQuery:updateSql];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs3;
        //                    NSLog(@"rs3");
        
        
        
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO deposit VALUES ('%@', '%@', '%@', '%@', '%@' ,'EU' ,'%@')",accountto,textfield.text,period,savetime,account,currencyto];
        rs3 = [dataBase executeQuery:insertSql];
        while ([rs3 next]) {
            NSLog(@"success update");
        }
        [rs3 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"EU set deposit",currencyto,savetime,textfield.text];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:@"Do you want to save the memo on your iPHone?"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    if (buttonIndex==0&&[flag isEqualToString:@"US1"]) {
        NSLog(@"case 2");
        id<PLResultSet> rs5;
        NSString *customermemoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"US set deposit",currencyto,savetime,textfield.text];
        rs5 = [dataBase executeQuery:customermemoSql];
        while ([rs5 next]) {
            NSLog(@"success update");
        }
        [rs5 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,accountto,@"US set deposit",currency,currencyto,textfield.text,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",accountto,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
//        [self presentModalViewController:main animated:NO];
        [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

    }
    
    if (buttonIndex==0&&[flag isEqualToString:@"US0"]) {
        NSLog(@"case 1");
        flag=@"US1";
        id<PLResultSet> rs2;
        //                    NSLog(@"rs2");
        NSString *updateSql = [NSString stringWithFormat:@"update for set US = US - %d where aid = '%@'",[textfield.text intValue],account];
        rs2 = [dataBase executeQuery:updateSql];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs3;
        //                    NSLog(@"rs3");
        
        
        
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO deposit VALUES ('%@', '%@', '%@', '%@', '%@' ,'US' ,'%@')",accountto,textfield.text,period,savetime,account,currencyto];
        rs3 = [dataBase executeQuery:insertSql];
        while ([rs3 next]) {
            NSLog(@"success update");
        }
        [rs3 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"US set deposit",currencyto,savetime,textfield.text];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:@"Do you want to save the memo on your iPHone?"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    if (buttonIndex==0&&[flag isEqualToString:@"HK1"]) {
        NSLog(@"case 2");
        id<PLResultSet> rs5;
        NSString *customermemoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"HK set deposit",currencyto,savetime,textfield.text];
        rs5 = [dataBase executeQuery:customermemoSql];
        while ([rs5 next]) {
            NSLog(@"success update");
        }
        [rs5 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,accountto,@"HK set deposit",currency,currencyto,textfield.text,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",accountto,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
//        [self presentModalViewController:main animated:NO];
        [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

    }
    
    if (buttonIndex==0&&[flag isEqualToString:@"HK0"]) {
        NSLog(@"case 1");
        flag=@"HK1";
        id<PLResultSet> rs2;
        //                    NSLog(@"rs2");
        NSString *updateSql = [NSString stringWithFormat:@"update for set HK = HK - %d where aid = '%@'",[textfield.text intValue],account];
        rs2 = [dataBase executeQuery:updateSql];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs3;
        //                    NSLog(@"rs3");
        
        
        
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO deposit VALUES ('%@', '%@', '%@', '%@', '%@' ,'HK' ,'%@')",accountto,textfield.text,period,savetime,account,currencyto];
        rs3 = [dataBase executeQuery:insertSql];
        while ([rs3 next]) {
            NSLog(@"success update");
        }
        [rs3 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@ %@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",accountto,savetime],account,accountto,@"HK set deposit",currencyto,savetime,textfield.text];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:@"Do you want to save the memo on your iPHone?"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
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

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return [array count];
    }else if(component==1){
        return [montharray count];
    }else{
        return [array2 count];
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==0) {
        return [array objectAtIndex:row];
    }else if(component==1){
        return [montharray objectAtIndex:row];
    }else{
        return [array2 objectAtIndex:row];
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    UILabel *myView = nil;
    
    if (component == 0) {
        
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 225, 30)] autorelease];
        
        myView.textAlignment = UITextAlignmentCenter;
        
        myView.text = [array objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }else if(component==1){
        
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 30, 30)] autorelease];
        
        myView.text = [montharray objectAtIndex:row];
        
        myView.textAlignment = UITextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
        
    }else{
        
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 50, 30)] autorelease];
        
        myView.text = [array2 objectAtIndex:row];
        
        myView.textAlignment = UITextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 3;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (CGFloat)pickerView: (UIPickerView *)pickerView widthForComponent:(NSInteger) component{
    if (component==0) {
        return 225;
    }else if(component==1){
        return 30;
    }else{
        return 50;
    }
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
    interest=[[NSString alloc]init];
    interest=@"interesting rate is 2.6%";
    period=[[NSString alloc]init];
    period=@"3";
    flag=[[NSString alloc]init];
    flag=@"0";
    array2=[[NSMutableArray alloc]initWithObjects:@"RMB",@"US",@"EU",@"HK", nil];
    currencyto=[[NSString alloc]init];
    currencyto=@"RMB";
    array=[[NSMutableArray alloc]init];
    montharray=[[NSArray alloc]initWithObjects:@"3",@"6",@"12", nil];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
//    NSLog(@"%@",user);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@' and type = 2",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *findaccount = [rs objectForColumn:@"aid"];
        [array addObject:findaccount];
//        NSLog(@"array:%@",array);
	}
    accountto=[[NSString alloc]init];
    accountto=[array objectAtIndex:0];
//    NSLog(@"account to is %@",accountto);
    [rs close];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        accountto = [array objectAtIndex:row];
        NSLog(@"%@",accountto);
//		[picker selectRow:0 inComponent:1 animated:NO];
//        [pickerView reloadComponent:1];
		[pickerView reloadAllComponents];
		
		
	}else if (component==1) {
        if (row==0) {
            period=@"3";
            interest=@"interest rate is 2.6%";
        }else if (row==1){
            period=@"6";
            interest=@"interest rate is 2.8%";
        }else{
            period=@"12";
            interest=@"interest rate is 3.0%";
        }
        NSLog(@"%@",period);
        //		DataBase*database=[DataBase shareDataBase];
        //		ProvinceObject*city=[self.cityArray objectAtIndex:row];
        //		NSLog(@"+++++%d",row);
        //		NSLog(@"选中的市区的id：%d",city.cityId);
        //
        //
        //		self.zoneArray=[database searchZoneInCity:[NSString stringWithFormat:@"select * from T_Zone WHERE CityID=%d;",city.cityId]];
        //		[picker selectRow:0 inComponent:2 animated:YES];
		[picker reloadAllComponents];
	}else if(component==2){
        currencyto=[array2 objectAtIndex:row];
        NSLog(@"%@",currencyto);
    }
}

@end
