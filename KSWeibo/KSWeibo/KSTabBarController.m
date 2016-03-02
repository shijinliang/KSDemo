//
//  KSTabBarController.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/1.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSTabBarController.h"
#import "KSTabBar.h"

@interface KSTabBarController()<KSTabBarDelegate>

@end

@implementation KSTabBarController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KSTabBar *tabBar = [[KSTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    [self addChildViewController:vc1 imageName:@"tabbar_home" title:@"首页"];
    UIViewController *vc2 = [[UIViewController alloc] init];
    [self addChildViewController:vc2 imageName:@"tabbar_message_center" title:@"消息"];
    UIViewController *vc3 = [[UIViewController alloc] init];
    [self addChildViewController:vc3 imageName:@"tabbar_discover" title:@"发现"];
    UIViewController *vc4 = [[UIViewController alloc] init];
    [self addChildViewController:vc4 imageName:@"tabbar_profile" title:@"我"];
}

- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName title:(NSString *)title
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [childController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    childController.tabBarItem.title = title;
    [self addChildViewController:childController];
}

#pragma mark - KSTabBar delegate
- (void)tabBar:(KSTabBar *)tabBar clickPlusBtn:(UIButton *)clickBtn
{
    NSLog(@"点击加号");
}

@end
