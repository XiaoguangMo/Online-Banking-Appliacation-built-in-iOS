//
//  SetDepositDetailViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-12-8.
//
//

#import <UIKit/UIKit.h>

@interface SetDepositDetailViewController : UIViewController{
    UIPickerView *picker;
    NSString *user;
//    IBOutlet UILabel *label;
    NSMutableArray *array;
    NSMutableArray *array2;
//    NSArray *currencyarray;
    NSArray *montharray;
    NSArray *deposit;
    NSString *currencyto;
    NSString *get;
    NSString *account;
    NSString *currency;
    NSString *accountto;
    NSString *period;
    IBOutlet UITextField *textfield;
    NSString *flag;
    NSString *interest;
}
@property (retain, nonatomic)NSString *user;
//@property (retain, nonatomic)IBOutlet UILabel *label;
@property (retain, nonatomic) NSMutableArray *array;
@property (retain, nonatomic) NSMutableArray *array2;
@property (retain, nonatomic) IBOutlet UIPickerView *picker;
//@property (retain, nonatomic) NSArray *currencyarray;
@property (retain, nonatomic) NSArray *montharray;
@property (retain, nonatomic) NSString *currencyto;
@property (retain, nonatomic) NSString *account;
@property (retain, nonatomic) NSString *currency;
@property (retain, nonatomic) NSString *accountto;
//@property (retain, nonatomic) NSArray *deposit;
@property (retain, nonatomic) IBOutlet UITextField *textfield;
@property (retain, nonatomic) NSString *period;
@property (retain, nonatomic) NSString *flag;
//@property (retain, nonatomic) NSString *interest;
@property (retain, nonatomic) NSString *get;

-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)submit:(id)sender;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
