//
// Created by Vishnu Karthik on 15/03/14.
// Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import "VKViewCell.h"

@interface VKViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *weaponName;
@property (weak, nonatomic) IBOutlet UILabel *kills;
@end

@implementation VKViewCell {

}
- (void)setWeapon:(NSString *)weapon {
    [[self weaponName] setText:weapon];
}

- (void)setNoOfKills:(int) kills {
    NSString *string = [NSString stringWithFormat:@"%d %s",kills,"kills"];
    [[self kills] setText: string];
}
@end