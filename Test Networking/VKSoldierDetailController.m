//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "VKSoldierDetailController.h"
#import "VKSoldierStat.h"
#import "VKViewCell.h"
#import "VKWeaponStat.h"


@interface VKSoldierDetailController ()
@property VKSoldierStat *soldierStat;

@end

@implementation VKSoldierDetailController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soldierStat = [[VKSoldierStat alloc] initWithName:self.name loadHandler:self];
    [self.soldierStat loadData];
}

- (void)notify {

    [self.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.soldierStat size];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    VKViewCell *cell = (VKViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    VKWeaponStat *weapon = [self.soldierStat.data objectAtIndex:indexPath.row];
    [cell setWeapon:weapon.name];
    [cell setNoOfKills:weapon.kills];

    NSLog(@"Iam here %d", indexPath.row);
    return cell;
}


@end