//
//  ViewController.m
//  24点
//
//  Created by 周子聪 on 15/9/10.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize theGameViewController;
@synthesize setUpViewController;
- (IBAction)ClickBegainTheGame:(id)sender{
    if (self.theGameViewController.view==nil) {
        self.theGameViewController=[[TheGameViewController alloc] initWithNibName:@"TheGameViewController" bundle: nil];
    }
    [self.view insertSubview:theGameViewController.view atIndex:4];
    
}

- (IBAction)ClickSetUpTheGame:(id)sender{
        self.setUpViewController=[[SetUpViewController alloc] initWithNibName:@"SetUpViewController" bundle: nil];
    [self.view insertSubview:setUpViewController.view atIndex:4];
    ;
}
- (IBAction)ClickAboutTheGame:(id)sender{
    ;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
