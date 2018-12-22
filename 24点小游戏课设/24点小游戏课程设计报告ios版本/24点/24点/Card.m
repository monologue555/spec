//
//  Card.m
//  24点
//
//  Created by 周子聪 on 15/9/10.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize eSuit;
@synthesize Point;
- (id)initWithSuit:(int)suit and:(int)point{
    if (self=[super init]) {
        self.eSuit=suit;
        self.Point=point;
    }
    return self;
}
@end
