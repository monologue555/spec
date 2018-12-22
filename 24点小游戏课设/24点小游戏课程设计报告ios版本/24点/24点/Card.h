//
//  Card.h
//  24点
//
//  Created by 周子聪 on 15/9/21.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum Suit{
//    heart=3,diamond,club,spade
//};
@interface Card : NSObject
@property (nonatomic,assign) int Point;
@property (nonatomic,assign) int eSuit;
- (id)initWithSuit:(int)suit and:(int)point;
@end
