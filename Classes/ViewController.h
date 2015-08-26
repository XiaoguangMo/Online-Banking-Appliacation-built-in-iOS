//
//  ViewController.h
//  OnlineBank
//
//  Created by NNNO on 12-11-19.
//  Copyright (c) 2012年 NNNO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface ViewController : UIViewController{
//    DataBase *database;
//    IBOutlet UILabel *label;
    IBOutlet UITextField *user;
    IBOutlet UITextField *pw;
}

-(IBAction)Login:(id)sender;
//@property (nonatomic, retain)DataBase *database;
//@property (nonatomic, retain)IBOutlet UILabel *label;
@property (nonatomic, retain)IBOutlet UITextField *user;
@property (nonatomic, retain)IBOutlet UITextField *pw;
//+ (NSArray *) findAll;
@end
