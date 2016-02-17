##KSDemo
收集常用demo和自己平时的总结


* **轮播图**  →  用scrollView实现的轮播图  
已实现封装完成的ScrollImageView，直接调用

```
	// 定义好宽高即可，这里用的屏幕宽高
    _scrollImageView = [[ScrollImageView alloc] initWithFrame:CGRectMake(0, 0, ScrollWidth, ScrollHeight)];）
    
    自定义的两个变量，控制scrollView和图片的宽高，可以随意修改为自己需要的
    #define ScreenSize      [UIScreen mainScreen].bounds.size
	#define ScrollWidth     ScreenSize.width
	#define ScrollHeight    450
```
