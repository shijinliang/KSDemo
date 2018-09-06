//
//  ScrollImageView.h
//  轮播图
//
//  Created by xiaoshi on 16/2/17.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollImageView;

@protocol ScrollImageViewDelegate <NSObject>
-(void)scrollImageView:(ScrollImageView *)srollImageView didTapImageView:(UIImageView *)image atIndex:(NSInteger)index;
@end
@interface ScrollImageView : UIView
@property (nonatomic,weak)id<ScrollImageViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame andPictureUrls:(NSArray *)urls andPlaceHolderImages:(NSArray *)images;
/**
 需要在使用地方（比如ViewController）销毁的时候，显示调用此方法，否则会有内存泄漏
 */
- (void)releaseTheScrollImageView;

@end
