//
//  AppHelper.m
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import "AppHelper.h"


@implementation AppHelper


+(void)getListWithUserInputText:(NSString *)userInputText andCompBlock:(receivedData)compblock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = serializer;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *urlString = [NSString stringWithFormat:@"%@=%@",BASE_URL,userInputText];
    
    NSLog(@"=============================CALLING API=============================: %@", urlString);

    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error = nil;
        NSArray* json = [NSJSONSerialization
                         JSONObjectWithData:responseObject
                         
                         options:kNilOptions
                         error:&error];
        
        if(json){
            
            if(!error){
                
                compblock(json);
            }
        }
        else
        {
            NSLog(@"The data from the request is empty.");
        }
        
        
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"%@",error);
             
         }];
}


@end
