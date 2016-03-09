//
//  ViewController.m
//  轮播图
//
//  Created by xiaoshi on 16/2/15.
//  Copyright © 2016年 kamy. All rights reserved.
//
#define ScreenSize      [UIScreen mainScreen].bounds.size
#define ScrollWidth     ScreenSize.width
#define ScrollHeight    450

#import "ViewController.h"
#import "ScrollImageView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)ScrollImageView *scrollImageView;

@end
@implementation ViewController

#pragma mark - ♻️ LifeCycle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"轮播图（无限循环）";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.scrollImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (ScrollImageView *)scrollImageView
{
    if (!_scrollImageView) {
        // 定义好宽高即可，这里用的屏幕宽高
        NSArray * dataUrls = @[@"http://",@"http://",@"http://",@"http://"];
        NSArray * dataPics = @[@"icc1",@"icc2",@"icc3",@"icc4",@"icc5"];
        _scrollImageView = [[ScrollImageView alloc] initWithFrame:CGRectMake(0, 64, ScrollWidth, ScrollHeight)andPictureUrls:dataUrls andPlaceHolderImages:dataPics];
    }
    return _scrollImageView;
}

@end
