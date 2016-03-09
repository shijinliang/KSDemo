//
//  KSTabBar.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/1.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSTabBar.h"

@interface KSTabBar()
@property (nonatomic, strong) UIButton *plusBtn;
@end

@implementation KSTabBar

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //增加中间的按钮
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        //设置button的大小
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger index = 0;
    //设置加号为中间
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    //重新排列四个tabbar
    for (int i = 0; i < self.subviews.count; i ++) {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGFloat tabBarBtnWidth = self.width * 0.2;
            view.width = tabBarBtnWidth;
            view.x = index * tabBarBtnWidth;
            if (index == 1) {
                index ++;
            }
            index ++;
        }
    }
}

- (void)clickBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBar:clickPlusBtn:)]) {
        [self.delegate tabBar:self clickPlusBtn:btn];
    }
}
@end
