//
//  AcronymsTableViewCell.h
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcronymsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;

@property (weak, nonatomic) IBOutlet UILabel *sinceLabel;

@end
