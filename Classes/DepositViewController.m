//
//  DepositViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "DepositViewController.h"
#import "ViewController.h"
#import "DataBase.h"
#import "SetDepositDetailViewController.h"
#import "CancelDepositViewController.h"

@interface DepositViewController ()

@end

@implementation DepositViewController
@synthesize picker;
@synthesize array;
@synthesize currencyarray;
@synthesize montharray;
@synthesize array2;
@synthesize label;
@synthesize user;
@synthesize currency;
@synthesize account;

-(IBAction)Set:(id)sender{
    SetDepositDetailViewController *depositDetail = [[SetDepositDetailViewController alloc]init];
    depositDetail.user=self.user;
    depositDetail.currency=self.currency;
    depositDetail.account=self.account;
    [self presentViewController:depositDetail animated:UIViewAnimationCurveEaseIn completion:nil];
//    [self presentModalViewController:depositDetail animated:NO];
}

-(IBAction)Check:(id)sender{
    CancelDepositViewController *cancel = [[CancelDepositViewController alloc]init];
    cancel.user=self.user;
    [self presentViewController:cancel animated:UIViewAnimationOptionAllowAnimatedContent completion:nil];
//    [self presentModalViewController:cancel animated:NO];
}

-(IBAction)Back:(id)sender{
    MainViewController *main = [[MainViewController alloc]init];
    main.user=self.user;
    [self presentViewController:main animated:UIViewAnimationOptionCurveLinear completion:nil];
//    [self presentModalViewController:main animated:NO];
}

-(IBAction)Logout:(id)sender{
    ViewController *login = [[ViewController alloc]init];
    [self presentViewController:login animated:UIViewAnimationTransitionFlipFromRight completion:nil];
//    [self presentModalViewController:login animated:NO];
}


//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    NSString *arrayName=[[NSString alloc] initWithFormat:@"column%d",component+1];
//    NSArray *array=[self valueForKey:arrayName];
//    return [array objectAtIndex:row%5];
//    
//}
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

- (CGFloat)pickerView: (UIPickerView *)pickerView widthForComponent:(NSInteger) component{
    if (component==0) {
        return 225;
    }else{
        return 80;
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

-(IBAction)Tab1:(id)sender{
    picker.hidden=!picker.hidden;
}

- (void)viewDidLoad
{
    array=[[NSMutableArray alloc]init];
    array2=[[NSMutableArray alloc]init];
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
//    NSLog(@"%@",user);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM account WHERE cid = '%@' and type = 1 or type = 3",user];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
        NSString *accountdb = [rs objectForColumn:@"aid"];
        NSString *atype = [rs objectForColumn:@"type"];
        [array addObject:accountdb];
        [array addObject:atype];
//        NSLog(@"array2:%@",array);
	}
    [rs close];
    montharray=[[NSArray alloc]initWithObjects:@"3mon",@"6mon",@"12mon", nil];
    currencyarray=[[NSArray alloc]initWithObjects:@"US",@"EU",@"HK",nil];
    RMBarray=[[NSArray alloc]initWithObjects:@"RMB",nil];
    account=array[0];
    if ([array[1] isEqualToString:@"1"]) {
        array2=[[NSMutableArray alloc]initWithArray:RMBarray];
//        array2=RMBarray;
        currency=@"RMB";
    }else{
        array2=[[NSMutableArray alloc]initWithArray:currencyarray];
//        array2=currencyarray;
        currency=@"US";
    }
//    [montharray addObject:@"3mon"];
//    [montharray addObject:@"6mon"];
//    [montharray addObject:@"12mon"];
    [super viewDidLoad];

    NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
    label.text=abc;
    // Do any additional setup after loading the view from its nib.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
		if (component==0) {
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
        
            NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
            label.text=abc;
        
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
		NSString *abc =[NSString stringWithFormat:@"%@,%@",account,currency];
        label.text=abc;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
