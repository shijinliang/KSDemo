//
//  KSNavigationController.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/8.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSNavigationController.h"

@interface KSNavigationController ()

@end

@implementation KSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *title = @"返回";
    if (self.childViewControllers.count == 1) {
        title = [self.childViewControllers firstObject].title;
    }
    if (self.childViewControllers.count) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem initBackWithImageName:@"navigationbar_back_withtext" hightImageName:@"navigationbar_back_withtext_highlighted" target:self action:@selector(back) title:title];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
