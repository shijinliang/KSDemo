//
//  CollectionImageView.m
//  CollectionView轮播图
//
//  Created by xiaoshi on 16/2/17.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "CollectionImageView.h"
#import "CollectionImageCell.h"

static NSInteger const SectionCount = 50;
@interface CollectionImageView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;
@end
@implementation CollectionImageView

#pragma mark - LifeCycle Method
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionCount/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    return self;
}

#pragma mark - CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return SectionCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionImageCell" forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"icc%ld",indexPath.row + 1];
    return cell;
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.itemSize = self.frame.size;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        //[_collectionView registerNib:[UINib nibWithNibName:@"CollectionImageCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionImageCell"];
        [_collectionView registerClass:[CollectionImageCell class] forCellWithReuseIdentifier:@"CollectionImageCell"];
    }
    return _collectionView;
}

@end
