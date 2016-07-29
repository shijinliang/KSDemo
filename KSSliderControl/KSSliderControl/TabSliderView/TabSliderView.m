//
//  TabSliderView.m
//  KSSliderControl
//
//  Created by xiaoshi on 16/3/18.
//  Copyright © 2016年 https://github.com/shijinliang, http://blog.csdn.net/sjl_leaf. All rights reserved.
//

#import "TabSliderView.h"

@implementation TabSliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scrollView];
    }
    return self;
}

#pragma mark - set Method
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    //设置数据的时候，需要把之前的全部移除，再重新加载
    [self removeAllViews];
    [self loadAllButton];
    
    NSInteger index = self.selectIndex;
    if (index >= self.dataArray.count ) {
        self.selectIndex = self.dataArray.count - 1;
    } else
    {
        self.selectIndex = index;
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    UIButton *btn = self.buttonArray[_selectIndex];
    if (btn) {
        [self buttonAction:btn];
    }
}

#pragma mark - private Method
- (void)loadAllButton
{
    //添加底线
    [self.scrollView addSubview:self.lineView];
    CGFloat width = 0;
    for (NSString *title in self.dataArray) {
        UIButton *btn = [self buttonWithTitle:title];
        CGRect frame = btn.frame;
        btn.frame = CGRectMake(width, 0, frame.size.width + 20, self.height);
        width += btn.width;
        [self.buttonArray addObject:btn];
        [self.scrollView insertSubview:btn belowSubview:self.lineView];
    }
}

- (UIButton *)buttonWithTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    btn.autoresizesSubviews = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    return btn;
}

- (void)buttonAction:(UIButton *)sender
{
    NSLog(@"点击");
    _selectIndex = [self.buttonArray indexOfObject:sender];
    for (UIButton *btn in self.buttonArray) {
        if (btn == sender) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
    [UIView animateWithDuration:0.3f animations:^{
        _lineView.frame = CGRectMake(sender.x, _lineView.y, sender.width, _lineView.height);
    }];
    
    if (_returnIndexBlock) {
        _returnIndexBlock(_selectIndex);
    }
}
- (void)removeAllViews
{
    NSArray *array = [self.scrollView subviews];
    for (UIView *view in array) {
        [view removeFromSuperview];
    }
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = NO;
        _scrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _scrollView;
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 3, 10, 3)];
        _lineView.backgroundColor = [UIColor yellowColor];
    }
    return _lineView;
}

@end
