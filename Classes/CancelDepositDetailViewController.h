//
//  CancelDepositDetailViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-12-9.
//
//

#import <UIKit/UIKit.h>

@interface CancelDepositDetailViewController : UIViewController{
    UIPickerView *picker;
    NSString *user;
    //    IBOutlet UILabel *label;
    NSMutableArray *array;
    NSMutableArray *array2;
    //    NSArray *currencyarray;
    //    NSArray *montharray;
    //    NSArray *deposit;
    NSString *account;
    NSString *time;
    NSString *fromaccount;
    NSString *fromcurrency;
    NSString *balance;
    //    NSString *currency;
    //    NSString *accountto;
    //    NSString *period;
    //    IBOutlet UITextField *textfield;
    //    NSString *flag;
}
@property (retain, nonatomic)NSString *user;
//@property (retain, nonatomic)IBOutlet UILabel *label;
@property (retain, nonatomic) NSMutableArray *array;
@property (retain, nonatomic) NSMutableArray *array2;
@property (retain, nonatomic) IBOutlet UIPickerView *picker;
//@property (retain, nonatomic) NSArray *currencyarray;
//@property (retain, nonatomic) NSArray *montharray;
//@property (retain, nonatomic) NSArray *RMBarray;
@property (retain, nonatomic) NSString *account;

@property (retain, nonatomic) NSString *time;
@property (retain, nonatomic) NSString *fromaccount;
@property (retain, nonatomic) NSString *fromcurrency;
@property (retain, nonatomic) NSString *balance;

//@property (retain, nonatomic) NSString *currency;
//@property (retain, nonatomic) NSString *accountto;
//@property (retain, nonatomic) NSArray *deposit;
//@property (retain, nonatomic) IBOutlet UITextField *textfield;
//@property (retain, nonatomic) NSString *period;
//@property (retain, nonatomic) NSString *flag;

-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)Cancel:(id)sender;

@end
