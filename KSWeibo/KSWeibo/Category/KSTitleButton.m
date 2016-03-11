//
//  KSTitleButton.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/8.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSTitleButton.h"

@implementation KSTitleButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //先调整title的位置
    self.titleLabel.x = 0;
    //再根据titleLabel的位置去设置imageView的x
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    
    //根据imageView的位置去设置自己的宽度
    self.width = CGRectGetMaxX(self.imageView.frame);
    
    self.centerX = self.superview.centerX;
}

@end
