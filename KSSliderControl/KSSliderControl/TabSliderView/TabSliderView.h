//
//  TabSliderView.h
//  KSSliderControl
//
//  Created by xiaoshi on 16/3/18.
//  Copyright © 2016年 https://github.com/shijinliang, http://blog.csdn.net/sjl_leaf. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectBlock)(NSInteger selectIndex);
@interface TabSliderView : UIView
/**
 *  放置所有标签的列表
 */
@property (nonatomic, retain)UIScrollView *scrollView;

/**
 *  滑动器里面的数据
 */
@property (nonatomic, retain)NSArray *dataArray;

/**
 *  存储button按钮的数组
 */
@property (nonatomic, retain)NSMutableArray *buttonArray;

/**
 *  对应的下面的线
 */
@property (nonatomic, retain)UIView *lineView;

/**
 *  选择索引id
 */
@property (nonatomic, assign)NSInteger selectIndex;

/**
 *  返回点击索引的block
 */
@property (nonatomic, copy)SelectBlock returnIndexBlock;
@end
