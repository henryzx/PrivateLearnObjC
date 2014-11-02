//
//  MyView.h
//  LearnMatchismo
//
//  Created by zhengxiao on 11/2/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Pannable <NSObject>

-(BOOL) shouldPanInRect: (CGRect) rect;

@optional

-(BOOL) shouldPan;

@end

@interface MyView : UIView

@property id<Pannable> pannable;

-(void) pan:(id) args;

-(void) registerPannable: (id<Pannable>) pannable;

@end
