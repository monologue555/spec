//
//  ViewController.h
//  24点
//
//  Created by 周子聪 on 15/9/10.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheGameViewController.h"
#import "SetUpViewController.h"
@interface ViewController : UIViewController
@property (retain, nonatomic) TheGameViewController *theGameViewController;
@property (retain, nonatomic) SetUpViewController *setUpViewController;

- (IBAction)ClickBegainTheGame:(id)sender;
- (IBAction)ClickSetUpTheGame:(id)sender;
- (IBAction)ClickAboutTheGame:(id)sender;
@end

