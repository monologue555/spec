//
//  SetUpViewController.m
//  24点
//
//  Created by 周子聪 on 15/10/7.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import "SetUpViewController.h"
#import "AppDelegate.h"
#import "TheGameViewController.h"
@interface SetUpViewController ()

@end

@implementation SetUpViewController

@synthesize Unabel;

- (IBAction)ChangeBangroundOfCard:(id)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.backgroundOfPoker=[sender imageForState:UIControlStateNormal];
    if (Unabel!=nil) {
        [Unabel setEnabled:1];
    }
    [sender setEnabled:0];
    Unabel=sender;
    
}

- (IBAction)ExitSetUp:(id)sender {
    [self.view removeFromSuperview];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
