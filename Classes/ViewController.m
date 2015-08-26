//
//  ViewController.m
//  OnlineBank
//
//  Created by NNNO on 12-11-19.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import "ViewController.h"
#import "DataBase.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize database;
//@synthesize label;
@synthesize user;
@synthesize pw;

//+ (NSArray *) findAll{
//	PLSqliteDatabase *dataBase = [DataBase setup];
//	
//	id<PLResultSet> rs;
//	rs = [dataBase executeQuery:@"SELECT * FROM customer"];
//	
//	//定义一个数组存放所有书籍的信息
//	NSMutableArray *books = [[NSMutableArray alloc] init];
//	
//	//把rs中的数据库信息遍历到books数组
//	while ([rs next]) {
//		NSString *ID = [rs objectForColumn:@"CID"];
//		NSString *name = [rs objectForColumn:@"PASSWORD"];
//		NSString *author = [rs objectForColumn:@"GENDER"];
//		NSString *publishHouse = [rs objectForColumn:@"TEL"];
//		NSString *date = [rs objectForColumn:@"ADDRESS"];
//		NSString *briefIntroducation = [rs objectForColumn:@"ADDRESS"];
//        NSArray *a = [[NSArray alloc]initWithArray:ID,name,author,publishHouse,date,briefIntroducation];
//		//初始化book 存放到books里面
//	}
//	//关闭数据库
//	[rs close];
//	
//	return a;
//}

- (IBAction)textFieldShouldReturn:(UITextField *)textField {
    if (textField == user) {
        [user resignFirstResponder];
    }
    if (textField == pw) {
        [pw resignFirstResponder];
    }
}

-(IBAction)Login:(id)sender{
    PLSqliteDatabase *dataBase = [DataBase setup];
	id<PLResultSet> rs;
    NSLog(@"%@",user.text);
    NSString *findSql = [NSString stringWithFormat:@"select * FROM customer WHERE cid = '%@'",user.text];
	rs = [dataBase executeQuery:findSql];
	while ([rs next]) {
		NSString *password = [rs objectForColumn:@"password"];
//        if ([password isEqualToString:pw.text]){
        if (1){
            NSLog(@"%@",pw.text);
            MainViewController *main = [[MainViewController alloc]init];
            main.user=user.text;
//            [self presentModalViewController:main animated:NO];
            [self presentViewController:main animated:UIViewAnimationOptionBeginFromCurrentState completion:nil];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                          message:@"Your password is wrong！"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [alert show];
        }
        NSLog(@"%@",password);
	}
    [rs close];
//
//           MainViewController *main = [[MainViewController alloc]init];
//           main.user=@"NNNO";
//           [self presentModalViewController:main animated:NO];

	}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
