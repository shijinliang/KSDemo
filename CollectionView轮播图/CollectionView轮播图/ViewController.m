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
    NSArray *images = @[@"icc1",@"icc2",@"icc3",@"icc4",@"icc5"];
    CollectionImageView *view = [[CollectionImageView alloc]initWithFrame:CGRectMake(0, 100, ScreenSize.width, 300) imageArray:images selectImageBlock:^(NSInteger index) {
        NSLog(@"点击的是第%d个",index);
    }];
    [self.view addSubview:view];
    self.navigationItem.title = @"Collection实现轮播图";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
