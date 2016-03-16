//
//  UIBarButtonItem+KSExtension.h
//  KSWeibo
//
//  Created by xiaoshi on 16/3/11.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KSExtension)

/**
 *  设置UIBarButtonItem
 *
 *  @param imageName      默认状态下的图片名字
 *  @param hightImageName 高亮图片名字
 *  @param target         
 *  @param action
 *
 *  @return 一个UIBarButtonItem
 */
+ (UIBarButtonItem *)initWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action;

/**
 *  设置返回 UIBarButtonItem
 *
 *  @param imageName      默认状态下的图片名字
 *  @param hightImageName 高亮图片名字
 *  @param target
 *  @param action
 *  @param title    文字
 *
 *  @return 一个UIBarButtonItem
 */
+ (UIBarButtonItem *)initBackWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action title:(NSString *)title;

@end
