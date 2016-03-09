//
//  KSTabBar.h
//  KSWeibo
//
//  Created by xiaoshi on 16/3/1.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSTabBar;

typedef void(^clickPlusBtn)(UIButton *btn);

@protocol KSTabBarDelegate <NSObject, UITabBarDelegate>

- (void)tabBar:(KSTabBar *)tabBar clickPlusBtn:(UIButton *)clickBtn;

@end

@interface KSTabBar : UITabBar
@property (nonatomic, assign) id<KSTabBarDelegate> delegate;
@end
