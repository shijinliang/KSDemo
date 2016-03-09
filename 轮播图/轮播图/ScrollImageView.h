//
//  ScrollImageView.h
//  轮播图
//
//  Created by xiaoshi on 16/2/17.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollImageView : UIView
-(instancetype)initWithFrame:(CGRect)frame andPictureUrls:(NSArray *)urls andPlaceHolderImages:(NSArray *)images;
@end
