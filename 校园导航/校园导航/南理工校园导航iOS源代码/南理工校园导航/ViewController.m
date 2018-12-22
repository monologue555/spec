//
//  ViewController.m
//  南理工校园导航
//
//  Created by 周子聪 on 16/4/16.
//  Copyright © 2016年 独白SKY. All rights reserved.
//

#import "ViewController.h"
#import "Graph.cpp"
#import "Masonry.h"
@interface ViewController ()

@property (nonatomic,assign) NSInteger startPoint;
@property (nonatomic,assign) NSInteger endPoint;
@property (nonatomic,assign) CGPoint start;
@property (nonatomic,assign) CGPoint end;
@property (strong, nonatomic) UILabel* labelOut;
@property (strong, nonatomic) UILabel* labelStart;
@property (strong, nonatomic) UILabel* labelEnd;
@property (weak, nonatomic) IBOutlet UIImageView *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startPoint=-1;
    self.endPoint=-1;
/*    for (int i = 0; i<30; i++) {
        UIButton* button=[self.view viewWithTag:i];
        NSLog(@"%i%@",i,button.titleLabel.text);
    }
    //打印30个地点的名字
 */
    
    self.labelOut=[[UILabel alloc] init];
    self.labelOut.text=[NSString stringWithFormat:@""];
    self.labelOut.numberOfLines=0;
    [self.view addSubview:self.labelOut];
    [self.labelOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(90);
        make.width.offset(400);
        make.bottom.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
    }];
   self.labelStart=[[UILabel alloc] init];
    
    [self.view addSubview:self.labelStart];
    [self.labelStart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(30);
        make.width.offset(150);
        make.bottom.equalTo(self.view).offset(-90);
        make.left.equalTo(self.view).offset(20);
    }];
    self.labelEnd=[[UILabel alloc] init];
    self.labelEnd.text=[NSString stringWithFormat:@""];
    [self.view addSubview:self.labelEnd];
    [self.labelEnd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(30);
        make.width.offset(150);
        make.bottom.equalTo(self.view).offset(-90);
        make.left.equalTo(self.view).offset(170);
    }];
    UIButton* sure=[[UIButton alloc] init];
    [sure setBackgroundImage:[UIImage imageNamed:@"QQ20160418-0"] forState:UIControlStateNormal];
    [sure setTitle:@"" forState:UIControlStateNormal];
    [self.view addSubview:sure];
    [sure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(30);
        make.width.offset(30);
        make.bottom.equalTo(self.view).offset(-90);
        make.left.equalTo(self.view).offset(320);
    }];
    [sure addTarget:self action:@selector(findingShortestPath) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getInformation:(UIButton*)sender {
    
    NSString* str=sender.titleLabel.text;

    if (self.startPoint==-1) {
        self.startPoint=sender.tag;
        self.start=sender.center;
        self.labelStart.text=[NSString stringWithFormat:@"出发点:%@",str];
    }else
    {
        self.endPoint=sender.tag;
        self.end=sender.center;
        self.labelEnd.text=[NSString stringWithFormat:@"目的地:%@",str];
    }
    
    
}

- (void)findingShortestPath
{
    int A[30][30]={
        0,100,60,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,200,0,0,0,0,0,
        100,0,100,0,0,0,0,0,0,0,0,0,0,0,40,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        60,100,0,60,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,
        0,0,60,0,20,30,0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,20,20,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,200,170,0,0,0,0,0,
        0,0,0,30,50,0,0,60,200,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,40,40,0,60,0,
        0,0,0,0,0,60,0,0,150,30,70,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,200,0,150,0,180,0,200,0,0,160,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,30,180,0,0,0,0,0,0,0,50,20,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,70,0,0,0,0,0,60,0,0,50,0,0,0,0,0,0,200,0,0,60,0,0,0,
        0,0,0,0,0,0,0,0,200,0,0,0,60,0,0,0,0,260,100,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,70,0,0,0,0,0,0,0,0,0,50,0,
        0,0,0,0,0,50,0,50,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,
        0,40,0,60,0,0,0,0,160,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        100,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,50,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,0,0,0,
        0,0,0,0,0,0,30,0,0,20,0,260,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,100,70,0,0,0,0,0,0,30,70,0,0,0,0,0,0,0,160,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,0,100,190,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70,100,0,40,180,0,0,0,0,0,240,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,190,40,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,180,0,0,0,0,200,0,0,0,0,
        0,0,0,0,200,0,0,0,0,0,200,0,0,200,0,0,0,0,0,0,0,0,0,0,40,0,0,80,0,0,
        200,0,160,0,170,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40,0,0,0,0,0,120,
        0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,200,0,0,0,50,0,140,0,
        0,0,0,0,0,0,40,0,0,0,60,0,0,0,0,0,20,70,0,0,0,0,0,0,0,50,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,80,0,0,0,0,0,50,
        0,0,0,0,0,0,60,0,0,0,0,0,50,0,0,0,0,0,160,0,240,0,0,0,0,140,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,120,0,0,50,0,0,
    };
/*  0-29编号分别代表
    0教育超市
    1二十五舍
    2一舍
    3四舍
    4三舍
    5六舍
    6明理居
    7体育馆
    8二运
    9八舍
    10谊园
    11二十四舍A
    12二十四舍B
    13兵乓馆
    14清真食堂
    15培训楼
    16七舍
    17十舍
    18求真园265栋
    19知行驿
    20智慧阁
    21智慧阁301栋
    22留园
    23图书馆
    24思源楼220栋
    25宁静轩东门
    26明理居东门
    27综合楼
    28宁静轩西门
    29致远楼
*/
    bool p[30][30];
    int D[30];
    int start=(int)self.startPoint;//设置起点
    int end=(int)self.endPoint;//设置终点
    struct MGraph dijkstra;
    dijkstra=initByArrage(A);
    ShortestPath_DIJ(start, end, p, D, dijkstra);
    
    
    int point[30];
    int distance[30];
    int index=0;
    
    
    
    for (int v=0; v<30; v++) {
        if (p[end][v]==true) {
            point[index]=v;
            distance[index]=D[v];
            index++;
        }
    }
    
    
    int i, j, tempp,tempd;
    for (j = 0; j < index -1; j++)
        for (i = 0; i < index  - j - 1; i++)
        {
            if(distance[i] > distance[i + 1])
            {
                tempp = point[i];
                point[i] = point[i + 1];
                point[i + 1] = tempp;
                
                tempd = distance[i];
                distance[i] = distance[i + 1];
                distance[i + 1] = tempd;
            }
        }
    //总长度D[end]  路线point[] 所经过的点个数index
    for (int i=0; i<index-1; i++) {
        UIButton* start=[self.view viewWithTag:point[i]];
        UIButton* end=[self.view viewWithTag:point[i+1]];
        [self makeLineFrom:start.center to:end.center];
    }
    
    NSMutableString* str=[NSMutableString stringWithFormat:@"最短路径:"];
    for (int i=0; i<index; i++) {
        UIButton* line=[self.view viewWithTag:point[i]];
        if (i!=0) {
            [str appendFormat:@"->"];
        }
        [str appendFormat:@"%@",line.titleLabel.text];
    }
    [str appendFormat:@"  总行程%i米",D[end]];
    self.labelOut.text=str;
}


-(void)makeLineFrom:(CGPoint)start to:(CGPoint)end{
    UIGraphicsBeginImageContext(self.map.frame.size);
    [self.map.image drawInRect:CGRectMake(0, 0, self.map.frame.size.width, self.map.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.5, 0.0, 0.5,1.0);  //颜色
    //+ (UIColor *)redColor;        // 1.0, 0.0, 0.0 RGB
    //+ (UIColor *)greenColor;      // 0.0, 1.0, 0.0 RGB
    //+ (UIColor *)blueColor;       // 0.0, 0.0, 1.0 RGB
    //+ (UIColor *)cyanColor;       // 0.0, 1.0, 1.0 RGB
    //+ (UIColor *)yellowColor;     // 1.0, 1.0, 0.0 RGB
    //+ (UIColor *)magentaColor;    // 1.0, 0.0, 1.0 RGB
    //+ (UIColor *)orangeColor;     // 1.0, 0.5, 0.0 RGB
    //+ (UIColor *)purpleColor;     // 0.5, 0.0, 0.5 RGB
    //+ (UIColor *)brownColor;      // 0.6, 0.4, 0.2 RGB
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), start.x,start.y);  //起点坐标
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), end.x, end.y);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.map.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
