##scrollView实现无限轮播

这里为了实现真实的无限轮播，采用了 n+2 张图片轮播，代码控制，显示 第2 ~ 第n+1张图片。

**1、**第1、n+1个图片一样，第2,n+2 个图片一样，具体看代码，

```
//第一张图片(向前拖拽，为了循环，第一张图应该和显示的最后一张图一样)
    UIImageView *firstImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icc5"]];
    firstImage.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.scrollView addSubview:firstImage];
    
    //最后一张图片(向后拖拽，为了循环，最后一张图应该和显示的第一张图一样)
    UIImageView *lastImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icc1"]];
    lastImage.frame = CGRectMake((imageCount + 1) * ScreenWidth, 0, ScreenWidth, ScreenHeight);
    [self.scrollView addSubview:lastImage];
    //第二张图 → 倒数第二张图
    for (NSInteger i = 0; i < imageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icc%ld",i + 1]]];
        imageView.frame = CGRectMake(ScreenWidth * (i + 1), 0, ScreenWidth, ScreenHeight);
        [self.scrollView addSubview:imageView];
    }


```
----

**2、**手动实现循环滚动，首先需要知道scrollView滚动结束调用的这两个方法：

```
	/**
	 *  当滚动视图动画完成后，调用该方法，如果没有动画，那么该方法不会被调用，
 	 *  下面两个方法为有效的动画方法，
	 *  setContentOffset:<#(CGPoint)#> animated:<#(BOOL)#>
	 *  scrollRectToVisible:<#(CGRect)#> animated:<#(BOOL)#>
	 */
	- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
	
	/**
 	 *  滚动视图减速完成,滚动将停止时,调用该方法。一次有效滑动,只执行一次。
 	 */
	- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView

```

**所以我们需要在这两个方法里面去处理一下scrollView**

   * scrollView当前是最后一张图的时候，设置offset为第二张图（这里要无动画哦~，当然你也可以尝试下有动画是什么效果）。
   * scrollView当前是第一张图的时候，设置offset为倒数第二张图（同理，无动画）

----

最后就是计时器的设置，开始拖拽的时候我们需要取消计时器，拖拽结束的时候使用计时器，分别为下面两个方法：

	- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
	- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

项目地址：[https://github.com/shijinliang/KSDemo](https://github.com/shijinliang/KSDemo)下面的轮播图文件夹

####下一个demo会使用collectionView实现轮播图。