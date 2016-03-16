//
//  CollectionImageCell.m
//  CollectionView轮播图
//
//  Created by xiaoshi on 16/2/17.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "CollectionImageCell.h"
#import "UIImageView+WebCache.h"

@interface CollectionImageCell()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation CollectionImageCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.imageView];
        
        self.imageView.frame = self.bounds;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://m1.dwstatic.com/mbox/article_img/toutiao_6546d9e4e8aa8dcbcf9a7518fcebf037.jpg"] placeholderImage:[UIImage imageNamed:@"icc1"]];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
@end
