//
//  ViewController.m
//  CollectionView轮播图
//
//  Created by xiaoshi on 16/2/17.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "ViewController.h"
#import "CollectionImageView.h"
#define ScreenSize      [UIScreen mainScreen].bounds.size
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor greenColor];
    
    CollectionImageView *view = [[CollectionImageView alloc]initWithFrame:CGRectMake(0, 100, ScreenSize.width, 300)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
