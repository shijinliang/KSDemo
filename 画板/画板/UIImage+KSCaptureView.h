//
//  UIImage+KSCaptureView.h
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KSCaptureView)
/**
 *  接收一个view，返回一个view的视图
 *
 *  @param view
 *
 *  @return 
 */
+ (UIImage *)KSCaptureImageWithView:(UIView *)view;

@end
