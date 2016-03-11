//
//  UIBarButtonItem+KSExtension.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/11.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "UIBarButtonItem+KSExtension.h"

@implementation UIBarButtonItem (KSExtension)

+ (UIBarButtonItem *)initWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action
{
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [itemBtn setImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    itemBtn.size = itemBtn.currentImage.size;
    [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
}

@end
