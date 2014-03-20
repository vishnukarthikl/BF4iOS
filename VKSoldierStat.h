//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKSoldierDetailController;


@interface VKSoldierStat : NSObject
@property NSMutableArray *data;
- (id)initWithName:(NSString *)name loadHandler:(VKSoldierDetailController *)handler;
- (void)loadData;

- (NSInteger)size;
@end