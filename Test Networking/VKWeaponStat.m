//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import "VKWeaponStat.h"


@implementation VKWeaponStat {

}
- (VKWeaponStat *)initWithName:(NSString *)name kills:(NSInteger)kills {
    self = [super init];
    if (self) {
        self.name = name;
        self.kills = kills;

    }
    return self;
}

@end