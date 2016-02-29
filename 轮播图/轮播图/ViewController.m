//
//  ViewController.m
//  轮播图
//
//  Created by xiaoshi on 16/2/15.
//  Copyright © 2016年 kamy. All rights reserved.
//

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
    
    //这样操作可以释放scrollImageView
    [self.scrollImageView removeFromSuperview];
    [self.scrollImageView.timer invalidate];
    self.scrollImageView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (ScrollImageView *)scrollImageView
{
    if (!_scrollImageView) {
        // 定义好宽高即可，这里用的屏幕宽高
        _scrollImageView = [[ScrollImageView alloc] initWithFrame:CGRectMake(0, 0, ScrollWidth, ScrollHeight)];
    }
    return _scrollImageView;
}

@end
