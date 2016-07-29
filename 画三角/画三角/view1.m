//
//  view1.m
//  画三角
//
//  Created by xiaoshi on 16/3/10.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "view1.h"

@implementation view1

- (void)drawRect:(CGRect)rect
{
    //使用uiKit中的贝塞尔曲线
    /*
     UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 50)];
     UIBezierPath *p1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 40) cornerRadius:10];
     [[UIColor blueColor] setFill];
     [p fill];
     */
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(100,150,100,100));
    
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillPath(con);
    
    
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    
    CGContextMoveToPoint(con, 80, 25);
    
    CGContextAddLineToPoint(con, 100, 0);
    
    CGContextAddLineToPoint(con, 120, 25);
    
    CGContextFillPath(con);
}

@end
