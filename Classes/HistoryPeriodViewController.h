//
//  HistoryPeriodViewController.h
//  BookManage
//
//  Created by NNNO on 12-12-5.
//
//

#import <UIKit/UIKit.h>

@interface HistoryPeriodViewController : UIViewController{
    UIPickerView *picker;
    IBOutlet UIDatePicker *datepicker;
    NSString *user;
    //    IBOutlet UILabel *label;
    NSMutableArray *array;
    NSMutableArray *array2;
    //    NSArray *currencyarray;
    //    NSArray *montharray;
    //    NSArray *deposit;
    NSString *account;
    NSString *datebegin;
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
//@property (retain, nonatomic) NSString *currency;
//@property (retain, nonatomic) NSString *accountto;
//@property (retain, nonatomic) NSArray *deposit;
//@property (retain, nonatomic) IBOutlet UITextField *textfield;
//@property (retain, nonatomic) NSString *period;
//@property (retain, nonatomic) NSString *flag;
@property (retain, nonatomic) IBOutlet UIDatePicker *datepicker;
@property (retain, nonatomic) NSString *datebegin;

-(IBAction)Logout:(id)sender;
-(IBAction)Back:(id)sender;
-(IBAction)Selete:(id)sender;

@end
