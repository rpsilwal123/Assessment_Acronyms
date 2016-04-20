//
//  AppHelper.h
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#define BASE_URL @"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf"

typedef void(^receivedData)(id receivedData);


@interface AppHelper : NSObject


+(void)getListWithUserInputText:(NSString *)userInputText andCompBlock:(receivedData)compblock;



@end
