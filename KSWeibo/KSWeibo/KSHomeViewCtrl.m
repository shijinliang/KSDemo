//
//  KSHomeViewCtrl.m
//  KSWeibo
//
//  Created by xiaoshi on 16/3/11.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSHomeViewCtrl.h"
#import "KSTitleButton.h"

@implementation KSHomeViewCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KSTitleButton *titleBtn = [KSTitleButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn sizeToFit];
    titleBtn.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = titleBtn;
}

@end
