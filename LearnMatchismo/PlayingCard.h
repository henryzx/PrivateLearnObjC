//
//  PlayingCard.h
//  LearnMatchismo
//
//  Created by zhengxiao on 10/30/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;


+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
