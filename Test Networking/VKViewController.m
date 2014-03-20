//
//  VKViewController.m
//  Test Networking
//
//  Created by Vishnu Karthik on 15/03/14.
//  Copyright (c) 2014 Vishnu Karthik. All rights reserved.
//

#import "VKViewController.h"
#import "VKSoldierDetailController.h"

@interface VKViewController ()
@property(weak, nonatomic) IBOutlet UITextField *soldierName;

@end

@implementation VKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    NSString *name = [self.soldierName text];
    VKSoldierDetailController *detailController = (VKSoldierDetailController *) [segue destinationViewController];
    [detailController setName:name];
}

@end
