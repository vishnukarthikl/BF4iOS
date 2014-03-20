//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VKWeaponStat : NSObject
@property NSString *name;
@property NSInteger kills;

- (VKWeaponStat *)initWithName:(NSString *)name kills:(NSInteger)kills;

@end