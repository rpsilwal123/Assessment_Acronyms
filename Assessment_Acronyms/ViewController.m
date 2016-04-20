//
//  ViewController.m
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import "ViewController.h"
#import "Acronyms.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initializeView{
    
    userTableView.hidden = YES;
    
    userInputTextField.delegate = self;
    
    searchButton.layer.cornerRadius = 5;
    
    userTableView.tableFooterView = [UIView new];
}


#pragma mark UITableViewDelegate and UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"AcronymsTableViewCell";
    
    AcronymsTableViewCell *cell = (AcronymsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(!cell)
        cell = [(AcronymsTableViewCell *)[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    NSDictionary *acronymsDict = [listArray objectAtIndex:indexPath.row];
    
    Acronyms *ac = [[Acronyms alloc]initWithDictionary:acronymsDict];
    
    cell.titleLabel.text = ac.searchedWord;
    
    cell.frequencyLabel.text = [NSString stringWithFormat:@"Frequency: %@", ac.frequency];
    
    cell.sinceLabel.text = [NSString stringWithFormat:@"Since: %@", ac.since];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


#pragma mark UITextfieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return NO;
}


#pragma mark IBActions

- (IBAction)searchButtonPressed:(UIButton *)sender {
    
    if(userInputTextField.text.length <=3){
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [userInputTextField resignFirstResponder];
        
        listArray = [NSMutableArray new];
        
        [AppHelper getListWithUserInputText:userInputTextField.text andCompBlock:^(id receivedData) {
            
            if(receivedData && [receivedData isKindOfClass:[NSArray class]]){
                
                listArray = [receivedData firstObject][@"lfs"];
                
                userTableView.delegate = (id) self;
                userTableView.dataSource = (id) self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [userTableView reloadData];
                    
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    
                    userTableView.hidden = NO;
                    
                    userInputTextField.text = @"";
                    
                });
            }
            else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
                [self displayAlertWith:@"An Error Occured" andAlertMessage:@"Please try again"];
            }
        }];
    }
    else{
        
        [self displayAlertWith:@"Alert" andAlertMessage:@"Please enter a Two or Three Letter Acronym"];
        
    }
}


-(void)displayAlertWith:(NSString *)alertTitle andAlertMessage:(NSString *)message{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:alertTitle
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
