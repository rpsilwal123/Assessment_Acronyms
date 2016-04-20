//
//  Acronyms.m
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import "Acronyms.h"

@implementation Acronyms

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    
    self = [super init];
    
    if(!self)
        return nil;
    
    
    _dataDictionary = dict;
    
    _searchedWord = dict[@"lf"];
    
    _frequency = dict[@"freq"];
    
    _since = dict[@"since"];
    
    return self;
}



@end
