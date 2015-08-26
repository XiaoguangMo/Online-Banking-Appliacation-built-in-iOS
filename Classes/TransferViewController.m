//
//  TransferViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "TransferViewController.h"
#import "ViewController.h"
#import "DataBase.h"
#import "TransferDetailViewController.h"

@interface TransferViewController ()

@end

@implementation TransferViewController
@synthesize array;
@synthesize user;
@synthesize account;
@synthesize textfield;
@synthesize picker;
@synthesize array2;
@synthesize currencyarray;
@synthesize RMBarray;
@synthesize currency;
//@synthesize account2;
@synthesize accountTextfield;
@synthesize account2type;

-(IBAction)submit:(id)sender{
    NSScanner* scan = [NSScanner scannerWithString:textfield.text];
    NSScanner* scan2 = [NSScanner scannerWithString:accountTextfield.text];
    int val;
    int val2;
    //    return[scan scanInt:&val] && [scan isAtEnd];
    //    NSString *warning;
    if (!([scan scanInt:&val] && [scan isAtEnd])) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The amount should be pure integer.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }else if (!([scan2 scanInt:&val2] && [scan2 isAtEnd])){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The input of account illegal.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }else{
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        //            NSLog(@"%@",user);
        //            NSLog(@"%@",account);
        NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE aid = '%@' and type <> 2",accountTextfield.text];
        NSLog(@"aid=%@",accountTextfield.text);
        rs = [dataBase executeQuery:findSql];
        NSString *found;
        while ([rs next]) {
            found = [rs objectForColumn:@"aid"];
            account2type=[rs objectForColumn:@"type"];
//            [foundarray addObject:found];
//            [foundarray addObject:account2type];
            NSLog(@"result:%@",found);
        }
        [rs close];
        if (![found isEqualToString:accountTextfield.text]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                           message:(@"Target account not found.")
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }else{
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
                        TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
                        detail.user=self.user;
                        detail.account=self.account;
                        detail.amount=self.textfield.text;
                        detail.currency=self.currency;
                        detail.account2=self.accountTextfield.text;
                        detail.account2type=self.account2type;
                        NSLog(@"%@",account2type);
//                        [self presentModalViewController:detail animated:NO];
                        [self presentViewController:detail animated:UIViewAnimationCurveEaseOut completion:nil];

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
                        TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
                        detail.user=self.user;
                        detail.account=self.account;
                        detail.amount=self.textfield.text;
                        detail.currency=self.currency;
                        detail.account2=self.accountTextfield.text;
                        detail.account2type=self.account2type;
//                        NSLog(@"detail....account %@amount%@currency %@ ... ",detail.account,detail.amount,detail.currency);
//                        [self presentModalViewController:detail animated:NO];
                        [self presentViewController:detail animated:UIViewAnimationCurveEaseOut completion:nil];

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
                        TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
                        detail.user=self.user;
                        detail.account=self.account;
                        detail.amount=self.textfield.text;
                        detail.currency=self.currency;
                        detail.account2=self.accountTextfield.text;
                        detail.account2type=self.account2type;
//                        [self presentViewController:detail animated:NO completion:nil];
//                        [self presentModalViewController:detail animated:NO];
                        [self presentViewController:detail animated:UIViewAnimationCurveEaseOut completion:nil];

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
                        TransferDetailViewController *detail = [[TransferDetailViewController alloc]init];
                        detail.user=self.user;
                        detail.account=self.account;
                        detail.amount=self.textfield.text;
                        detail.currency=self.currency;
                        detail.account2=self.accountTextfield.text;
                        detail.account2type=self.account2type;
//                        [self presentModalViewController:detail animated:NO];
                        [self presentViewController:detail animated:UIViewAnimationCurveEaseOut completion:nil];

                    }
                }
                [rs close];
            }
        }
//        NSLog(@"currency:%@",currency);
        
        
    }
}

-(IBAction)Back:(id)sender{
    MainViewController *main = [[MainViewController alloc]init];
    main.user=self.user;
//    [self presentModalViewController:main animated:NO];
    [self presentViewController:main animated:UIViewAnimationCurveEaseOut completion:nil];

}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
//    [self presentModalViewController:login animated:NO];
    [self presentViewController:login animated:UIViewAnimationCurveEaseOut completion:nil];

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
    currency=[[NSString alloc]init];
    currencyarray=[[NSArray alloc]initWithObjects:@"US",@"EU",@"HK",nil];
    RMBarray=[[NSArray alloc]initWithObjects:@"RMB",nil];
    array=[[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSLog(@"%@",user);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@' and type <> 2",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *account1= [rs objectForColumn:@"aid"];
        NSString *type= [rs objectForColumn:@"type"];
        [array addObject:account1];
        [array addObject:type];
        NSLog(@"array:%@",array);
	}
    [rs close];
    account=array[0];
    if ([array[1] isEqualToString:@"1"]) {
        array2=[[NSMutableArray alloc]initWithArray:RMBarray];
        currency=@"RMB";
    }else{
        array2=[[NSMutableArray alloc]initWithArray:currencyarray];
        currency=@"US";
    }
    NSLog(@"currency%@",currency);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)pickerView: (UIPickerView *)pickerView widthForComponent:(NSInteger) component{
    if (component==0) {
        return 225;
    }else{
        return 80;
    }
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return ([array count]/2);
    }else{
        return [array2 count];
    }
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==0) {
        return [array objectAtIndex:(row*2)];
    }else{
        return [array2 objectAtIndex:row];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 2;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        NSLog(@"select row:%d",row);
        account = [array objectAtIndex:(row*2)];
        if ([[array objectAtIndex:(row*2+1)] isEqualToString:@"3"]) {
            array2=[[NSMutableArray alloc]initWithArray:currencyarray];
//            array2=currencyarray;
            currency=@"US";
        }else{
            array2=[[NSMutableArray alloc]initWithArray:RMBarray];
//            array2=RMBarray;
            currency=@"RMB";
        }
        
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
		[picker selectRow:0 inComponent:1 animated:YES];
        //
        //		[picker selectRow:0 inComponent:2 animated:YES];
        [pickerView reloadComponent:1];
		[pickerView reloadAllComponents];
		
		
	}else if (component==1) {
        currency=[array2 objectAtIndex:row];
        //		DataBase*database=[DataBase shareDataBase];
        //		ProvinceObject*city=[self.cityArray objectAtIndex:row];
        //		NSLog(@"+++++%d",row);
        //		NSLog(@"选中的市区的id：%d",city.cityId);
        //
        //
        //		self.zoneArray=[database searchZoneInCity:[NSString stringWithFormat:@"select * from T_Zone WHERE CityID=%d;",city.cityId]];
        //		[picker selectRow:0 inComponent:2 animated:YES];
		[picker reloadAllComponents];
//		NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
//        NSLog(abc);
	}
}

@end
