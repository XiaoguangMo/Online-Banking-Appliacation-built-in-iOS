//
//  TransferDetailViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-12-9.
//
//

#import "TransferDetailViewController.h"
#import "TransferViewController.h"
#import "DataBase.h"
#import "ViewController.h"
#import "MainViewController.h"

@interface TransferDetailViewController ()

@end

@implementation TransferDetailViewController
@synthesize array;
@synthesize user;
@synthesize account;
//@synthesize textfield;
@synthesize picker;
@synthesize array2;
@synthesize currencyarray;
@synthesize RMBarray;
@synthesize currency;
@synthesize amount;
@synthesize currency2;
@synthesize account2;
@synthesize account2type;
@synthesize flag;

-(IBAction)submit:(id)sender{
    if ([currency isEqualToString:@"RMB"]) {
        flag=@"1";
        if ([currency2 isEqualToString:@"RMB"]) {
            flag=@"11";
            if ([account isEqualToString:account2]) {
                flag=@"000";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                               message:@"You can't transfer to the same account with same currency!"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
                [alert show];
                MainViewController *main = [[MainViewController alloc]init];
                main.user=self.user;
//                [self presentModalViewController:main animated:NO];
                [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

            }
        }else if ([currency2 isEqualToString:@"US"]){
            flag=@"12";
        }else if ([currency2 isEqualToString:@"EU"]){
            flag=@"13";
        }else if ([currency2 isEqualToString:@"HK"]){
            flag=@"14";
        }
    }else if ([currency isEqualToString:@"US"]){
        flag=@"2";
        if ([currency2 isEqualToString:@"RMB"]) {
            flag=@"21";
        }else if ([currency2 isEqualToString:@"US"]){
            flag=@"22";
            if ([account isEqualToString:account2]) {
                flag=@"000";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                               message:@"You can't transfer to the same account with same currency!"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
                [alert show];
                MainViewController *main = [[MainViewController alloc]init];
                main.user=self.user;
                [self presentModalViewController:main animated:NO];
            }
        }else if ([currency2 isEqualToString:@"EU"]){
            flag=@"23";
        }else if ([currency2 isEqualToString:@"HK"]){
            flag=@"24";
        }
    }else if ([currency isEqualToString:@"EU"]){
        flag=@"3";
        if ([currency2 isEqualToString:@"RMB"]) {
            flag=@"31";
        }else if ([currency2 isEqualToString:@"US"]){
            flag=@"32";
        }else if ([currency2 isEqualToString:@"EU"]){
            flag=@"33";
            if ([account isEqualToString:account2]) {
                flag=@"000";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                               message:@"You can't transfer to the same account with same currency!"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
                [alert show];
                MainViewController *main = [[MainViewController alloc]init];
                main.user=self.user;
//                [self presentModalViewController:main animated:NO];
                [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

            }
        }else if ([currency2 isEqualToString:@"HK"]){
            flag=@"34";
        }
    }else if ([currency isEqualToString:@"HK"]){
        flag=@"4";
        if ([currency2 isEqualToString:@"RMB"]) {
            flag=@"41";
        }else if ([currency2 isEqualToString:@"US"]){
            flag=@"42";
        }else if ([currency2 isEqualToString:@"EU"]){
            flag=@"43";
        }else if ([currency2 isEqualToString:@"HK"]){
            flag=@"44";
            if ([account isEqualToString:account2]) {
                flag=@"000";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                               message:@"You can't transfer to the same account with same currency!"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
                [alert show];
                MainViewController *main = [[MainViewController alloc]init];
                main.user=self.user;
                [self presentModalViewController:main animated:NO];
            }
        }
    }if (![flag isEqualToString:@"000"]) {
        NSLog(@"account%@,amount%@,currency%@,account2%@,currency2%@",account,amount,currency,account2,currency2);
        NSLog(@"%@",flag);
        NSString *message = [NSString stringWithFormat:@"You will transfer %@ %@ from %@ to %@ and currency for %@, are you sure?",amount,currency,account,account2,currency2];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    NSLog(@"%@",flag);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSString *year = [NSString stringWithFormat:@"%d",[comps year]];
    NSString *month = [NSString stringWithFormat:@"%d",[comps month]];
    NSString *day = [NSString stringWithFormat:@"%d",[comps day]];
    NSString *hour = [NSString stringWithFormat:@"%d",[comps hour]];
    NSString *min = [NSString stringWithFormat:@"%d",[comps minute]];
    NSString *sec = [NSString stringWithFormat:@"%d",[comps second]];
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
    if ([flag isEqualToString:@"11"]&&buttonIndex==0) {
        flag=@"111";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set balance = balance + %d where aid = '%@'",[amount intValue],account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
         NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"111"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"12"]&&buttonIndex==0){
        flag=@"121";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update for set US = US + %f where aid = '%@'",[amount floatValue]/6,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"121"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"13"]&&buttonIndex==0){
        flag=@"131";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update for set EU = EU + %f where aid = '%@'",[amount floatValue]/8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"131"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"14"]&&buttonIndex==0){
        flag=@"141";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update saving set balance = balance - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set HK = HK + %f where aid = '%@'",[amount floatValue]/0.8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"141"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"21"]&&buttonIndex==0){
        flag=@"211";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update for set US = US - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set balance = balance + %f where aid = '%@'",[amount floatValue]*6,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"211"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"22"]&&buttonIndex==0){
        flag=@"221";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update for set US = US - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set US = US + %d where aid = '%@'",[amount intValue],account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"221"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"23"]&&buttonIndex==0){
        NSLog(@"231");
        flag=@"231";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set US = US - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set EU = EU + %f where aid = '%@'",([amount floatValue]*6/8),account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"231"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"24"]&&buttonIndex==0){
        flag=@"241";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set US = US - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set HK = HK + %f where aid = '%@'",([amount floatValue]*6/0.8),account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"241"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"US transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"31"]&&buttonIndex==0){
        flag=@"311";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set EU = EU - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set balance = balance + %F where aid = '%@'",[amount floatValue]*8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"311"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"32"]&&buttonIndex==0){
        flag=@"321";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set EU = EU - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set US = US + %F where aid = '%@'",[amount floatValue]*8/6,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"321"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"33"]&&buttonIndex==0){
        flag=@"331";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set EU = EU - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set EU = EU + %d where aid = '%@'",[amount intValue],account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"331"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"34"]&&buttonIndex==0){
        flag=@"341";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set EU = EU - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set HK = HK + %F where aid = '%@'",[amount floatValue]*8/0.8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"341"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"EU transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"41"]&&buttonIndex==0){
        flag=@"411";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set HK = HK - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update saving set balance = balance + %F where aid = '%@'",[amount floatValue]*0.8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"411"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"42"]&&buttonIndex==0){
        flag=@"421";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set HK = HK - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set US = US + %F where aid = '%@'",[amount floatValue]*0.8/6,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"421"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to US",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"43"]&&buttonIndex==0){
        flag=@"431";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set HK = HK - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set EU = EU + %F where aid = '%@'",[amount floatValue]*0.8/8,account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"431"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to EU",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"44"]&&buttonIndex==0){
        flag=@"441";
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSString *updateSql = [NSString stringWithFormat:@"update FOR set HK = HK - %d where aid = '%@'",[amount intValue],account];
        rs = [dataBase executeQuery:updateSql];
        while ([rs next]) {
            NSLog(@"success update");
        }
        [rs close];
        PLSqliteDatabase *dataBase2 = [DataBase setup];
        id<PLResultSet> rs2;
        NSString *updateSql2 = [NSString stringWithFormat:@"update FOR set HK = HK + %d where aid = '%@'",[amount intValue],account2];
        rs2 = [dataBase2 executeQuery:updateSql2];
        while ([rs2 next]) {
            NSLog(@"success update");
        }
        [rs2 close];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO memo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"RMB transfer to RMB",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSString *message = [NSString stringWithFormat:@"You have transfered %@ %@ from %@ to %@ and currency for %@, transfer id is %@, do you want to save it on your iPhone?",amount,currency,account,account2,currency2,[NSString stringWithFormat:@"%@%@",account,savetime]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Memo"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"YES"
                                             otherButtonTitles:@"NO", nil];
        [alert show];
    }else if ([flag isEqualToString:@"441"]&&buttonIndex==0){
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs4;
        NSString *memoSql = [NSString stringWithFormat:@"INSERT INTO customermemo VALUES ('%@', '%@', '%@', '%@', '%@', '%@')",[NSString stringWithFormat:@"%@%@",account,savetime],account,account2,@"HK transfer to HK",savetime,amount];
        rs4 = [dataBase executeQuery:memoSql];
        while ([rs4 next]) {
            NSLog(@"success update");
        }
        [rs4 close];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *str =[NSString stringWithFormat:@"Account:%@\nTransfer to: %@\nTransfer type: %@\nFrom currency:%@\nTo currency:%@\nAmount:%@\nTime: %@",account,account2,@"Transfer",currency,currency2,amount,savetime];
        NSData *data = [str dataUsingEncoding:enc];
        NSString *filename =[NSString stringWithFormat:@"/Users/NNNO/Desktop/%@.txt",[NSString stringWithFormat:@"%@%@",account2,savetime]];
        [data writeToFile: filename atomically: NO];

        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"111"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"121"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"131"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"141"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"211"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"221"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"231"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"241"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"311"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"321"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"331"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"341"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"411"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"421"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"431"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }else if ([flag isEqualToString:@"441"]&&buttonIndex==1){
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }
//    if ([currency isEqualToString:@"RMB"]) {
//        
//        if ([currency2 isEqualToString:@"RMB"]) {
//            
//        }else if([currency2 isEqualToString:@"US"]){
//            PLSqliteDatabase *dataBase = [DataBase setup];
//            id<PLResultSet> rs2;
//            NSString *updateSql2 = [NSString stringWithFormat:@"update for set US = US - %f where aid = '%@'",([amount doubleValue]/6),account2];
//            rs2 = [dataBase executeQuery:updateSql2];
//            while ([rs2 next]) {
//                NSLog(@"success update");
//            }
//            [rs2 close];
//        }else if([currency2 isEqualToString:@"EU"]){
//            PLSqliteDatabase *dataBase = [DataBase setup];
//            id<PLResultSet> rs2;
//            NSString *updateSql2 = [NSString stringWithFormat:@"update for set EU = EU - %f where aid = '%@'",([amount doubleValue]/8),account2];
//            rs2 = [dataBase executeQuery:updateSql2];
//            while ([rs2 next]) {
//                NSLog(@"success update");
//            }
//            [rs2 close];
//        }else if([currency2 isEqualToString:@"HK"]){
//            PLSqliteDatabase *dataBase = [DataBase setup];
//            id<PLResultSet> rs2;
//            NSString *updateSql2 = [NSString stringWithFormat:@"update for set HK = HK - %f where aid = '%@'",([amount doubleValue]/0.8),account2];
//            rs2 = [dataBase executeQuery:updateSql2];
//            while ([rs2 next]) {
//                NSLog(@"success update");
//            }
//            [rs2 close];
//        }
//        
//    }else if([currency isEqualToString:@"US"]){
//        double amount2=[amount doubleValue]*6;
//        
//    }
    //    NSScanner* scan = [NSScanner scannerWithString:textfield.text];
    //    int val;
    //    //    return[scan scanInt:&val] && [scan isAtEnd];
    //    //    NSString *warning;
    //    if (!([scan scanInt:&val] && [scan isAtEnd])) {
    //
    //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
    //                                                       message:(@"The amount should be pure integer.")
    //                                                      delegate:nil
    //                                             cancelButtonTitle:@"OK"
    //                                             otherButtonTitles:nil];
    //        [alert show];
    //    }else{
    //        NSLog(@"currency:%@",currency);
    //        if ([currency isEqualToString:@"RMB"]) {
    //            PLSqliteDatabase *dataBase = [DataBase setup];
    //            id<PLResultSet> rs;
    //            //            NSLog(@"%@",user);
    //            //            NSLog(@"%@",account);
    //            NSString *findSql = [NSString stringWithFormat:@"select * FROM saving WHERE aid = '%@'",account];
    //            rs = [dataBase executeQuery:findSql];
    //            while ([rs next]) {
    //                //                NSLog(@"rs next");
    //                NSString *balance = [rs objectForColumn:@"balance"];
    //                int abalance = [balance intValue];
    //                int bbalance = [textfield.text intValue];
    //                if ((abalance-bbalance)<0) {
    //                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
    //                                                                   message:(@"You don't have enough money.")
    //                                                                  delegate:nil
    //                                                         cancelButtonTitle:@"OK"
    //                                                         otherButtonTitles:nil];
    //                    [alert show];
    //                }else{
    //                    TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
    //                    detail.user=self.user;
    //                    detail.account=self.account;
    //                    detail.amount=self.textfield.text;
    //                    detail.currency=self.currency;
    //                    [self presentModalViewController:detail animated:NO];
    //                }
    //            }
    //            [rs close];
    //
    //        }else if([currency isEqualToString:@"US"]){
    //            PLSqliteDatabase *dataBase = [DataBase setup];
    //            id<PLResultSet> rs;
    //            //            NSLog(@"%@",user);
    //            //            NSLog(@"%@",account);
    //            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
    //            rs = [dataBase executeQuery:findSql];
    //            while ([rs next]) {
    //                //                NSLog(@"rs next");
    //                NSString *balance = [rs objectForColumn:@"US"];
    //                int abalance = [balance intValue];
    //                int bbalance = [textfield.text intValue];
    //                if ((abalance-bbalance)<0) {
    //                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
    //                                                                   message:(@"You don't have enough money.")
    //                                                                  delegate:nil
    //                                                         cancelButtonTitle:@"OK"
    //                                                         otherButtonTitles:nil];
    //                    [alert show];
    //                }else{
    //                    TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
    //                    detail.user=self.user;
    //                    detail.account=self.account;
    //                    detail.amount=self.textfield.text;
    //                    detail.currency=self.currency;
    //                    [self presentModalViewController:detail animated:NO];
    //                }
    //            }
    //            [rs close];
    //        }else if([currency isEqualToString:@"EU"]){
    //            PLSqliteDatabase *dataBase = [DataBase setup];
    //            id<PLResultSet> rs;
    //            //            NSLog(@"%@",user);
    //            //            NSLog(@"%@",account);
    //            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
    //            rs = [dataBase executeQuery:findSql];
    //            while ([rs next]) {
    //                //                NSLog(@"rs next");
    //                NSString *balance = [rs objectForColumn:@"EU"];
    //                int abalance = [balance intValue];
    //                int bbalance = [textfield.text intValue];
    //                if ((abalance-bbalance)<0) {
    //                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
    //                                                                   message:(@"You don't have enough money.")
    //                                                                  delegate:nil
    //                                                         cancelButtonTitle:@"OK"
    //                                                         otherButtonTitles:nil];
    //                    [alert show];
    //                }else{
    //                    TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
    //                    detail.user=self.user;
    //                    detail.account=self.account;
    //                    detail.amount=self.textfield.text;
    //                    detail.currency=self.currency;
    //                    [self presentModalViewController:detail animated:NO];
    //                }
    //            }
    //            [rs close];
    //        }else if([currency isEqualToString:@"HK"]){
    //            PLSqliteDatabase *dataBase = [DataBase setup];
    //            id<PLResultSet> rs;
    //            //            NSLog(@"%@",user);
    //            //            NSLog(@"%@",account);
    //            NSString *findSql = [NSString stringWithFormat:@"select * FROM for WHERE aid = '%@'",account];
    //            rs = [dataBase executeQuery:findSql];
    //            while ([rs next]) {
    //                //                NSLog(@"rs next");
    //                NSString *balance = [rs objectForColumn:@"HK"];
    //                int abalance = [balance intValue];
    //                int bbalance = [textfield.text intValue];
    //                if ((abalance-bbalance)<0) {
    //                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
    //                                                                   message:(@"You don't have enough money.")
    //                                                                  delegate:nil
    //                                                         cancelButtonTitle:@"OK"
    //                                                         otherButtonTitles:nil];
    //                    [alert show];
    //                }else{
    //                    TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
    //                    detail.user=self.user;
    //                    detail.account=self.account;
    //                    detail.amount=self.textfield.text;
    //                    detail.currency=self.currency;
    //                    [self presentModalViewController:detail animated:NO];
    //                }
    //            }
    //            [rs close];
    //        }
    //        
    //    }
}

-(IBAction)Back:(id)sender{
    TransferViewController *transfer = [[TransferViewController alloc]init];
    transfer.user=self.user;
    [self presentModalViewController:transfer animated:NO];
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

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
//    currency2=[[NSString alloc]init];
    flag=[[NSString alloc]init];
    flag=@"0";
    currencyarray=[[NSArray alloc]initWithObjects:@"US",@"EU",@"HK",nil];
    RMBarray=[[NSArray alloc]initWithObjects:@"RMB",nil];
    array=[[NSMutableArray alloc]init];
    if ([account2type isEqualToString:@"1"]) {
        array2=RMBarray;
        currency2=@"RMB";
    }else{
        array2=currencyarray;
        currency2=@"US";
    }
    NSLog(@"%@,%@,%@,%@,%@",account,account2,account2type,amount,currency2);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

//- (CGFloat)pickerView: (UIPickerView *)pickerView widthForComponent:(NSInteger) component{
//    if (component==0) {
//        return 225;
//    }else{
//        return 80;
//    }
//}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
//    if (component==0) {
//        return ([array count]/2);
//    }else{
        return [array2 count];
//    }
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if (component==0) {
//        return [array objectAtIndex:(row*2)];
//    }else{
//        return [array2 objectAtIndex:row];
//    }
    return [array2 objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    if (component==0) {
//        account2 = [array objectAtIndex:(row*2)];
//        if ([[array objectAtIndex:(row+1)] isEqualToString:@"3"]) {
//            array2=currencyarray;
//            currency2=@"US";
//        }else{
//            array2=RMBarray;
//            currency2=@"RMB";
//        }
    
        //        NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
        //        label.text=abc;
        
        //		DataBase*database=[DataBase shareDataBase];
        //		ProvinceObject*province=[self.proArray objectAtIndex:row];
        //
        //		//NSLog(@"选中的省份：%@",province.proName);
        //		//		NSLog(@"它的id%d",province.proId);
        //		//这里我解释下  选中确定省份的时候可以从省份对象中确定它的省id 然后从数据库中选出与其对应的城市
        //		self.cityArray=[database searchCityInProvince:[NSString stringWithFormat:@"select * from T_City WHERE ProID=%d;",province.proId]];
        //		ProvinceObject*city=[self.cityArray objectAtIndex:0];
        //		NSLog(@"&&&&&&%@",city.proName);
        //		self.zoneArray=[database searchZoneInCity:[NSString stringWithFormat:@"select * from T_Zone WHERE CityID=%d;",city.cityId]];
        //
        //
        //
        //		//第二列默认选择第一行
//		[picker selectRow:0 inComponent:1 animated:YES];
        //
        //		[picker selectRow:0 inComponent:2 animated:YES];
//        [pickerView reloadComponent:1];
//		[pickerView reloadAllComponents];
		
		
//	}else if (component==1) {
        currency2=[array2 objectAtIndex:row];
        //		DataBase*database=[DataBase shareDataBase];
        //		ProvinceObject*city=[self.cityArray objectAtIndex:row];
        //		NSLog(@"+++++%d",row);
        //		NSLog(@"选中的市区的id：%d",city.cityId);
        //
        //
        //		self.zoneArray=[database searchZoneInCity:[NSString stringWithFormat:@"select * from T_Zone WHERE CityID=%d;",city.cityId]];
        //		[picker selectRow:0 inComponent:2 animated:YES];
//		[picker reloadAllComponents];
        //		NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
        //        NSLog(abc);
//	}
}
- (void)dealloc {
    [super dealloc];
    [picker dealloc];
    [array2 dealloc];
    [currencyarray dealloc];
    [RMBarray dealloc];
    [currency dealloc];
    [amount dealloc];
    [account2 dealloc];
    [flag dealloc];
    [account2type dealloc];}
@end
