##用CollectionView实现轮播图效果

思路：使用Section来实现，每一组的数据都一样，默认设置N组（正常情况下50-100即可，除非有人很无聊），然后添加定时器，使CollectionView滚动到相应的地方，手动拖拽是collectionView本身就具备的。

[https://github.com/shijinliang/KSDemo/tree/CollectionView轮播图](https://github.com/shijinliang/KSDemo/tree/CollectionView轮播图)
https://github.com/shijinliang/KSDemo里面的 一个分支，之后会合并到主分支，所以clone下来的master上会有一个文件夹“CollectionView轮播图”

封装方法：

```
typedef void(^selectImageBlock)(NSInteger index);

@interface CollectionImageView : UIView
/**
 *  封装collectionView实现轮播图
 *
 *  @param frame      传入轮播图的frame
 *  @param imageArray 图集数组表示
 *  @param block      点击图片的方法用block公开出去
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray selectImageBlock:(selectImageBlock) block;

```

集成“CollectionView封装”文件夹的代码，调用如下代码即可实现效果：
 
```
NSArray *images = @[@"icc1",@"icc2",@"icc3",@"icc4",@"icc5"];
CollectionImageView *view =
 [[CollectionImageView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300) 
 imageArray:images 
 selectImageBlock:^(NSInteger index) {
        NSLog(@"点击的是第%d个",index);
    }];
[self.view addSubview:view];
```


----

	小注：关于上面说的设置N组，在定时器状态下，有一个优化，可以使其在计算下一页的时候，先重算位置，无动画滚动到中间的那组。然后再滚动到下一页，这样collectionView只要2组就足够，但是拖拽的时候出问题了，会出现拖拽到屏幕外时可能返回当前页，未移动到目标页面。
	主要因为 NSIndexPath *currentPath = [[self.collectionView indexPathsForVisibleItems] lastObject]; 这部分代码导致，
	[self.collectionView indexPathsForVisibleItems]  此方法返回一个数组，有的时候返回一个NSIndexPath，有的时候返回的是两个，当返回两个的时候，手动拖拽可能会出现：
	我打印的是数组里面NSIndexPath的row，【1，2】  【2，1】，可能会出现这两种结果，所以拖拽的时候没有使用重算位置这个方法。
	
**哪位童鞋有好的办法欢迎指导**