//
//  TheGameViewController.h
//  24点
//
//  Created by 周子聪 on 15/9/15.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

struct ResultOfString{
    char _return[19];
};
@interface TheGameViewController : UIViewController<UIAlertViewDelegate,UITextViewDelegate>
{
    int Point;
    
    //所有结果为24的算式个数
    int NumOfResut;
    
    //储存所有结果为24的算式
    struct ResultOfString ResultString[100];
    
    //记录每一次用户点击字符的可变数组（字符串）
    NSMutableArray* caculatorString;
    
    //按钮可用不用状态变换时所需变量
    int index;
    NSMutableString *str;
    int ChooseTimeOfCard;
    int ChooseCardTag[4];
}
@property (weak, nonatomic) IBOutlet UILabel *Goal;
@property (weak, nonatomic) IBOutlet UILabel *Equal24;
//分数
@property (nonatomic,assign)int Point;
@property (nonatomic,assign) NSTimer* myTimer;
//用户计算式子Label显示
@property (weak, nonatomic) IBOutlet UILabel *stringOfCalculate;
@property (weak, nonatomic) IBOutlet UILabel *Timer;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

//TextView显示所有算法式子
@property (weak,nonatomic)IBOutlet UITextView* resultString;
@property (weak, nonatomic) IBOutlet UIButton *CloseButton;

//加减乘除扑克牌等控件的声明实现

@property (weak, nonatomic) IBOutlet UIButton *Begain;
@property (weak, nonatomic) IBOutlet UIButton *Add;
@property (weak, nonatomic) IBOutlet UIButton *Sub;
@property (weak, nonatomic) IBOutlet UIButton *Mul;
@property (weak, nonatomic) IBOutlet UIButton *Div;
@property (weak, nonatomic) IBOutlet UIButton *LeftBracket;
@property (weak, nonatomic) IBOutlet UIButton *RightBracket;
@property (weak, nonatomic) IBOutlet UIButton *Back;
@property (weak, nonatomic) IBOutlet UIButton *Equal;
@property (weak, nonatomic)IBOutlet UIButton *Card1;
@property (weak, nonatomic) IBOutlet UIButton *Card2;
@property (weak, nonatomic) IBOutlet UIButton *Card3;
@property (weak, nonatomic) IBOutlet UIButton *Card4;
@property (weak, nonatomic) IBOutlet UIImageView *VMwareImage;

- (void)setChooseCardTag:(int)Tag ByIndex:(int)i;
- (int) getChooseCardTagByIdex:(int)i;

//点击抽排，随机显示四张牌在下方
- (IBAction)ClickGetFourPoker:(id)sender;

//- (IBAction)ClickAdd:(id)sender;
//- (IBAction)ClickSub:(id)sender;
//- (IBAction)ClickMul:(id)sender;
//- (IBAction)ClickDiv:(id)sender;
//- (IBAction)ClickLeftBracket:(id)sender;
//- (IBAction)ClickRightBracket:(id)sender;

//点击卡牌，在上方Label出动态显示算式
- (IBAction)ClickCard:(id)sender;
//点击back，后退一步输入
- (IBAction)ClickBack:(id)sender;
//点击确认，显示得分情况
- (IBAction)ClickEqual:(id)sender;

@end
