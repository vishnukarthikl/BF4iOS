//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import "VKSoldierStat.h"
#import "AFHTTPRequestOperationManager.h"
#import "NSArray+ObjectiveSugar.h"
#import "VKSoldierDetailController.h"
#import "VKWeaponStat.h"

@interface VKSoldierStat ()
@property NSString *name;
@property(nonatomic, strong) id <VKStatProtocol> handler;
@end

@implementation VKSoldierStat {

}
- (id)initWithName:(NSString *)name loadHandler:(id <VKStatProtocol>)handler {
    self = [super init];
    if (self) {
        self.name = name;
        self.data = [[NSMutableArray alloc] init];
        self.handler = handler;
    }
    return self;
}

- (void)loadData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://api.bf4stats.com/api/playerInfo?plat=pc&name=%@", self.name] parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {

             NSArray *weapons = responseObject[@"weapons"];
             [weapons each:^(id object) {
                 NSDictionary *weaponData = object;
                 NSDictionary *stat = (NSDictionary *) weaponData[@"stat"];

                 VKWeaponStat *weaponStat = [[VKWeaponStat alloc] initWithName:weaponData[@"name"] kills:[stat[@"kills"] integerValue]];
                 [self.data addObject:weaponStat];
             }];
             [self.data sortUsingComparator:^NSComparisonResult(VKWeaponStat *obj1, VKWeaponStat *obj2) {
                 if ((obj2.kills - obj1.kills) > 0) {
                     return NSOrderedDescending;
                 }
                 else if (obj2.kills == obj2.kills){
                     return NSOrderedSame;
                 } else {
                     return NSOrderedAscending;
                 }
             }];
             [self.handler notify];

         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (NSInteger)size {
    return self.data.count;
}
@end