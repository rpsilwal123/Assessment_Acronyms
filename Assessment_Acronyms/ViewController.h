//
//  ViewController.h
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AcronymsTableViewCell.h"
#import "AppHelper.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate> {
    
    NSMutableArray *listArray;
    
    __weak IBOutlet UITextField *userInputTextField;
    
    __weak IBOutlet UITableView *userTableView;
    
    __weak IBOutlet UIButton *searchButton;

}




@end

