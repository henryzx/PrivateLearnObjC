//
//  MyView.m
//  LearnMatchismo
//
//  Created by zhengxiao on 11/2/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 */

/**
 * Draws a Triangle Shape
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    [self drawBackgroundImageInRect:rect context:context];
    
    [[UIColor greenColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [self drawRoundedCornerInRect: rect context: context];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    [path moveToPoint:CGPointMake(75, 10)];
    [path addLineToPoint:CGPointMake(160, 150)];
    [path addLineToPoint:CGPointMake(10, 150)];
    [path closePath];
    
    path.lineWidth = 2.0;
    
    [path fill];
    [path stroke];
    
    
    
}

- (void)drawRoundedCornerInRect:(CGRect)rect context:(CGContextRef) context{
    CGContextSaveGState(context);
    
    [[UIColor yellowColor] setStroke];
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(20, 20)];
    [roundedRect stroke];
    
    
    
    CGContextRestoreGState(context);
}


- (void) drawBackgroundImageInRect:(CGRect) rect context:(CGContextRef) context{
    CGContextSaveGState(context);
    
    UIImage *image = [UIImage imageNamed:@"avatar.png"];
    [image drawInRect:rect];
    
    CGContextRestoreGState(context);
}


@end
