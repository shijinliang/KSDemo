//
//  UIImage+KSCaptureView.m
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "UIImage+KSCaptureView.h"

@implementation UIImage (KSCaptureView)

+ (UIImage *)KSCaptureImageWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

@end
