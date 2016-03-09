//
//  KSTitleButton.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/8.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSTitleButton.h"

@implementation KSTitleButton

- (void)drawRect:(CGRect)rect
{
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    self.width = CGRectGetMaxX(self.imageView.frame);
}

@end
