//
//  Acronyms.h
//  LookUp
//
//  Created by Ranjan on 4/19/16.
//  Copyright © 2016 Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Acronyms : NSObject

@property (nonatomic,strong) NSDictionary *dataDictionary;

@property (nonatomic,strong) NSString *searchedWord;

@property (nonatomic,strong) NSNumber *frequency;

@property (nonatomic,strong) NSNumber *since;


-(instancetype)initWithDictionary:(NSDictionary*)dict;


@end
