//
//  BalanceViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-11-20.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BalanceViewController : UIViewController{
    NSString *user;
//    IBOutlet UILabel *label;
    NSMutableArray *array;
    IBOutlet UIPickerView *picker;
    NSString *aid;
    NSString *atype;
}

@property (retain, nonatomic)NSString *user;
//@property (retain, nonatomic)IBOutlet UILabel *label;
@property (retain, nonatomic)NSMutableArray *array;
@property (retain, nonatomic) IBOutlet UIPickerView *picker;
@property (retain, nonatomic)NSString *aid;
@property (retain, nonatomic)NSString *atype;

-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)check:(id)sender;
@end
