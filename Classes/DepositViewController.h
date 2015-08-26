//
//  DepositViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepositViewController : UIViewController{
    UIPickerView *picker;
    NSString *user;
    IBOutlet UILabel *label;
    NSMutableArray *array;
    NSMutableArray *array2;
    NSArray *currencyarray;
    NSArray *montharray;
    NSArray *RMBarray;
    NSString *account;
    NSString *currency;
}
@property (retain, nonatomic)NSString *user;
@property (retain, nonatomic)IBOutlet UILabel *label;
@property (retain, nonatomic) NSMutableArray *array;
@property (retain, nonatomic) NSMutableArray *array2;
@property (retain, nonatomic) IBOutlet UIPickerView *picker;
@property (retain, nonatomic) NSArray *currencyarray;
@property (retain, nonatomic) NSArray *montharray;
@property (retain, nonatomic) NSArray *RMBarray;
@property (retain, nonatomic) NSString *account;
@property (retain, nonatomic) NSString *currency;

-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)Set:(id)sender;
-(IBAction)Check:(id)sender;
@end
