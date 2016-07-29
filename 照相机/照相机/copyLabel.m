//
//  copyLabel.m
//  照相机
//
//  Created by xiaoshi on 16/3/10.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "copyLabel.h"

@implementation copyLabel
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(fuzhi:));
}

- (void)fuzhi:(id)sender
{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
}

- (void)attachTapHandler
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    ges.numberOfTapsRequired = 2;
    [self addGestureRecognizer:ges];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

- (void)handleTap:(UIGestureRecognizer *)recoginzer
{
    [self becomeFirstResponder];
    UIMenuItem *copyItem = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(fuzhi:)];
    [[UIMenuController sharedMenuController] setMenuItems:@[copyItem]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}

@end
