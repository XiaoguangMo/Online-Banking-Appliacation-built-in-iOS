//
//  MainViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-11-19.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "BalanceViewController.h"
#import "HistoryViewController.h"
#import "TransferViewController.h"
#import "DepositViewController.h"
#import "MaintainViewController.h"

@interface MainViewController : UIViewController{
    NSString *user;
    NSMutableArray *timearray;
    NSString *fromaccount;
    NSString *fromcurrency;
    NSString *balance2;
    NSString *period2;
    NSString *interest;
//    IBOutlet UILabel *label;
}

@property (retain, nonatomic)NSString *user;
@property (retain, nonatomic)NSMutableArray *timearray;
@property (retain, nonatomic) NSString *fromaccount;
@property (retain, nonatomic) NSString *fromcurrency;
@property (retain, nonatomic) NSString *balance2;
@property (retain, nonatomic) NSString *period2;
@property (retain, nonatomic) NSString *interest;
//@property (retain, nonatomic)IBOutlet UILabel *label;
-(IBAction)Balance:(id)sender;
-(IBAction)History:(id)sender;
-(IBAction)Transfer:(id)sender;
-(IBAction)Maintain:(id)sender;
-(IBAction)Deposit:(id)sender;
-(IBAction)Logout:(id)sender;
-(IBAction)Memo:(id)sender;
@end
