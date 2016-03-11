//
//  KSHomeViewCtrl.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/11.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSHomeViewCtrl.h"
#import "KSTitleButton.h"
#import "UIBarButtonItem+KSExtension.h"

@implementation KSHomeViewCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigation];
}

- (void)setNavigation
{
    //中间部分
    KSTitleButton *titleBtn = [KSTitleButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn sizeToFit];
    titleBtn.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = titleBtn;
    //左边
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithImageName:@"navigationbar_pop" hightImageName:@"navigationbar_pop_highlighted" target:self action:@selector(clickLeftItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    //右边
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithImageName:@"navigationbar_more" hightImageName:@"navigationbar_more_highlighted" target:self action:@selector(clickRightItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)clickLeftItem
{
    NSLog(@"%s",__func__);
}

- (void)clickRightItem
{
    NSLog(@"%s",__func__);
}

@end
