//
//  MyView.m
//  LearnMatchismo
//
//  Created by zhengxiao on 11/2/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "MyView.h"

@interface MyView()

@property (nonatomic) CGPoint origin;

@end

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
    
    [self drawOriginOvalWithContext: context];
    
}

- (void)drawRoundedCornerInRect:(CGRect)rect context:(CGContextRef) context{
    CGContextSaveGState(context);
    
    [[UIColor yellowColor] setFill];
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(20, 20)];
    [roundedRect fill];
    
    CGContextRestoreGState(context);
}


- (void) drawBackgroundImageInRect:(CGRect) rect context:(CGContextRef) context{
    CGContextSaveGState(context);
    
    UIImage *image = [UIImage imageNamed:@"avatar.png"];
    [image drawInRect:rect];
    
    CGContextRestoreGState(context);
}

/**
 * Draw a purple Oval over Origin Point
 */
- (void) drawOriginOvalWithContext: (CGContextRef) context{
    CGContextSaveGState(context);
    
    [[UIColor purpleColor] setFill];
    
    CGRect bounds = CGRectMake(self.origin.x, self.origin.y, 10, 10);
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:bounds];
    
    [oval fill];
    
    CGContextRestoreGState(context);
}

-(void) pan:(UIPanGestureRecognizer *)recognizer{
    if ((recognizer.state == UIGestureRecognizerStateChanged) || (recognizer.state == UIGestureRecognizerStateEnded)) {
        //NSLog(@"panning %@", recognizer);
        CGPoint translation = [recognizer translationInView:self];
        
        self.origin = CGPointMake(self.origin.x + translation.x, self.origin.y + translation.y);
        [recognizer setTranslation:CGPointZero inView:self];
        [self setNeedsDisplay];
    }
}

-(void) registerPannable:(id<Pannable>)pannable {
    self.pannable = pannable;
}

@end
