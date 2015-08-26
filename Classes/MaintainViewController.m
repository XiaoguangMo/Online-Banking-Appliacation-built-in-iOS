//
//  MaintainViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "MaintainViewController.h"
#import "ViewController.h"
#import "DataBase.h"

@interface MaintainViewController ()

@end

@implementation MaintainViewController
@synthesize mRadio1;
@synthesize mRadio2;
@synthesize password;
@synthesize confirm;
@synthesize address;
@synthesize phone;
@synthesize sex;
@synthesize user;
@synthesize label;

+ (BOOL) validateUserPasswd : (NSString *) str
{
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[a-zA-Z0-9]{6,16}$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
//    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ isNumbericString: YES", str);
        return YES;
    }
    
    NSLog(@"%@ isNumbericString: NO", str);
    return NO;
}

- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

-(IBAction)OK:(id)sender{
//    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
//                                              initWithPattern:@"^[0-9]{6,6}$"
//                                              options:NSRegularExpressionCaseInsensitive
//                                              error:nil];
//    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:password.text
//                                                                  options:NSMatchingReportProgress
//                                                                    range:NSMakeRange(0, password.text.length)];
    NSScanner* scan = [NSScanner scannerWithString:password.text];
    int val;
    NSScanner* scan2 = [NSScanner scannerWithString:confirm.text];
    int val2;
    NSScanner* scan3 = [NSScanner scannerWithString:phone.text];
    int val3;
//    return[scan scanInt:&val] && [scan isAtEnd];
//    NSString *warning;
    if (password.text.length!=6||confirm.text.length!=6) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The length of password should be 6.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else if (!([scan scanInt:&val] && [scan isAtEnd] && [scan2 scanInt:&val2] && [scan2 isAtEnd])) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The password should be pure integer.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else if(![password.text isEqualToString:confirm.text]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The passwords input should be the same.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else if(!([scan3 scanInt:&val3] && [scan3 isAtEnd])) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The phone number should be pure integer.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else if(address.text.length<=0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                       message:(@"The address is empty.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else{
        PLSqliteDatabase *dataBase = [DataBase setup];
        id<PLResultSet> rs;
        NSLog(@"%@",user);
        NSString *findSql = [NSString stringWithFormat:@"update customer set password = '%@', tel = '%@', address = '%@', gender = '%@'  where cid = '%@'",password.text,phone.text,address.text,sex,user];
        rs = [dataBase executeQuery:findSql];
        while ([rs next]) {
            
        }
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                       message:(@"Change successful.")
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        [rs close];
        MainViewController *main = [[MainViewController alloc]init];
        main.user=self.user;
        [self presentModalViewController:main animated:NO];
    }
//        else if(password.text!=confirm.text){
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning"
//                                                       message:(@"The passwords input should be the same!")
//                                                      delegate:nil
//                                             cancelButtonTitle:@"OK"
//                                             otherButtonTitles:nil];
//        [alert show];
//    }
//    NSLog(@"%@",password.text);
//    if ([password.text isEqualToString:@"123"]) {
//        NSLog(@"123");
//    }
//    if (password.text.length==3) {
//        NSLog(@"3");
//    }
//    NSLog(@"%d",password.text.length);

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

//- (IBAction)textFieldShouldReturn:(UITextField *)textField {
//    if (textField == password) {
//        [password resignFirstResponder];
//    }
//    else if (textField == confirm) {
//        [confirm resignFirstResponder];
//    }
//    else if (textField == address) {
//        [address resignFirstResponder];
//    }
//    else if (textField == phone) {
//        [phone resignFirstResponder];
//    }
//
//}

//-(IBAction)touchesBegan:(id)sender{
//        [confirm resignFirstResponder];
//        [phone resignFirstResponder];
//        [password resignFirstResponder];
//        [address resignFirstResponder];
//    
//}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)checkboxButton:(UIButton *)button
{
    
    for (UIButton * but in [self.view subviews])
    {
        if ([but isKindOfClass:[UIButton class]] && ![but isEqual:button])
        {
            [but setSelected:NO];
        }
    }
    if (!button.selected)
    {
        button.selected = !button.selected;
    }
    if (mRadio1.selected) {
        self.sex=@"male";
    }else{
        self.sex=@"female";
    }
    self.label.text=self.sex;
}

- (void)viewDidLoad
{
    [mRadio1 setSelected:true];
    PLSqliteDatabase *dataBase = [DataBase setup];
    id<PLResultSet> rs;
    NSLog(@"%@",user);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM customer WHERE cid = '%@'",user];
    rs = [dataBase executeQuery:findSql];
    while ([rs next]) {
        NSString *rpassword = [rs objectForColumn:@"password"];
        NSString *raddress = [rs objectForColumn:@"address"];
        NSString *rsex = [rs objectForColumn:@"gender"];
        NSString *rtel = [rs objectForColumn:@"tel"];
        password.text=rpassword;
        address.text=raddress;
        phone.text=rtel;
        if ([rsex isEqualToString:@"male"]) {
            self.sex=@"male";
            [mRadio1 setSelected:TRUE];
            [mRadio2 setSelected:false];
        }else{
            self.sex=@"female";
            [mRadio1 setSelected:false];
            [mRadio2 setSelected:TRUE];
        }
    }
    [rs close];
    self.sex=@"male";
    self.label.text=self.sex;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
