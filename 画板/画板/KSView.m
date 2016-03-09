//
//  KSView.m
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSView.h"

@interface KSView()
@property (nonatomic, strong)NSMutableArray *paths;
@end

@implementation KSView

- (void)clearView
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)backView
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取手指对应的touch对象
    UITouch *touch = [touches anyObject];
    
    CGPoint startPoint = [touch locationInView:touch.view];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path setLineWidth:5];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    [path moveToPoint:startPoint];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //这里注释掉就画的是直线
    [self touch:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touch:touches withEvent:event];
}

- (void)touch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movePath = [touch locationInView:touch.view];
    UIBezierPath *currentPath = [self.paths lastObject];
    [currentPath addLineToPoint:movePath];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}

- (NSMutableArray *)paths
{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

@end
