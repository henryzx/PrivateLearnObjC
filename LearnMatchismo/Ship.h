//
//  Ship.h
//  LearnMatchismo
//
//  Created by zhengxiao on 10/30/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ship : NSObject

- (void) move: (NSString *) steps withName:(NSString *) name;

- (NSString *) shoot;

@end
