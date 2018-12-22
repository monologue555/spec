//
//  Deck.h
//  24点
//
//  Created by 周子聪 on 15/9/21.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//
#import "Card.h"
#import <Foundation/Foundation.h>

@interface Deck : NSObject{
    Card* card[53];
}
- (Card*)getCard:(int)i;
- (id)init;
- (void)shuffle;
@end
