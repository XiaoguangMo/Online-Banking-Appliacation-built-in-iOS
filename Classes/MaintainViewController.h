//
//  MaintainViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaintainViewController : UIViewController{
    NSString *user;
    NSString *sex;
    IBOutlet UILabel *label;
    IBOutlet UIButton * mRadio1;
    IBOutlet UIButton * mRadio2;
    IBOutlet UITextField *password;
    IBOutlet UITextField *confirm;
    IBOutlet UITextField *address;
    IBOutlet UITextField *phone;
}

@property (retain, nonatomic)NSString *user;
@property (retain, nonatomic)IBOutlet UILabel *label;
@property (retain, nonatomic)IBOutlet UIButton * mRadio1;
@property (retain, nonatomic)IBOutlet UIButton * mRadio2;
@property (retain, nonatomic)NSString *sex;
@property (retain, nonatomic)IBOutlet UITextField *password;
@property (retain, nonatomic)IBOutlet UITextField *confirm;
@property (retain, nonatomic)IBOutlet UITextField *address;
@property (retain, nonatomic)IBOutlet UITextField *phone;
- (BOOL)isPureInt:(NSString*)string;
-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)OK:(id)sender;
//-(IBAction)touchesBegan:(id)sender;
@end
