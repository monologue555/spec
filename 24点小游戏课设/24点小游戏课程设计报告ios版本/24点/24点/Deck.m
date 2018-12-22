//
//  Deck.m
//  24点
//
//  Created by 周子聪 on 15/9/21.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import "Deck.h"
#import <time.h>
@implementation Deck
- (Card*)getCard:(int)i{
    return self->card[i];
}
- (id)init{
    if (self=[super init]) {
        for (int i = 1; i<5; i++) {
            for (int j= 1; j<14; j++) {
                self->card[(i-1)*13+j] = [[Card alloc] initWithSuit:i+2 and:j];
            }
        }
    }
    return self;
}
void swap(Card* a,Card* b){
    int tempEsuit = a.eSuit;
    int tempPoint = a.Point;
    a.eSuit=b.eSuit;
    a.Point=b.Point;
    b.eSuit=tempEsuit;
    b.Point=tempPoint;

}
- (void)shuffle{
    srand((unsigned)time(NULL));
    for (int i = 1; i < 53; i++)
    {
        int n = rand()%(53-i)+i;
        swap([self getCard:i], [self getCard:n]);
    }
}
@end
