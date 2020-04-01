//
//  IAFTabContentView.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFTabContentView.h"
#import "IAFTabContentCCell.h"
#import "IAFTabView.h"

@interface IAFTabContentView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;

@property (nonatomic, weak) NSArray   *tabItems;
@property (nonatomic, weak) IAFTabView *tabView;

@property (nonatomic, copy) DidChangeIndexBlockType  didChangeIndexBlock;

@property (nonatomic, assign) CGSize  itemSize;

@property (nonatomic, assign) NSInteger  currentIndex;

@end


@implementation IAFTabContentView

- (instancetype)initTabItems:(NSArray <id<IAFTabViewDelegate>> *)tabItems
            tabView:(IAFTabView*)tabView
         didChangeIndexBlock:(DidChangeIndexBlockType)didChangeIndexBlock {
    self = [super init];
    if(self) {
        _tabItems = tabItems;
        _tabView = tabView;
        _didChangeIndexBlock = didChangeIndexBlock;
        [self installUI];
    }
    return self;
}

- (void)installUI {
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
//        layout.itemSize = CGSizeMake(K_SCREEN_WIDTH, self.superview.bounds.size.height);
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _flowLayout = layout;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.pagingEnabled = true;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
        [_collectionView registerClass:IAFTabContentCCell.class forCellWithReuseIdentifier:IAFTabContentCCell.description];
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.showsHorizontalScrollIndicator = false;

        
//        Weak(weakSelf);
//        [_collectionView bxg_setHeaderRefreshBlock:^{
//            [weakSelf loadDataWithIsRefresh:true];
//        }];
    }
    return _collectionView;
}

- (CGSize)itemSize {
    if(CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        _itemSize.width = K_SCREEN_WIDTH;
        _itemSize.height = self.bounds.size.height;
    }
    return _itemSize;
}

- (void)setCurrentIndex:(NSInteger)newIndex {
    if(_currentIndex == newIndex) {
        return ;
    }
    _currentIndex = newIndex;
    if(self.didChangeIndexBlock) {
        self.didChangeIndexBlock(newIndex);
    }
    [self scrollToIndex:newIndex];
}

- (void)scrollToIndex:(NSInteger)index {
    [self.collectionView setContentOffset:CGPointMake(index*self.itemSize.width, 0) animated:false];
}


#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tabItems.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IAFTabContentCCell *cell = (IAFTabContentCCell*)([self.collectionView dequeueReusableCellWithReuseIdentifier:IAFTabContentCCell.description forIndexPath:indexPath]);
    if(indexPath.row<self.tabItems.count) {
        id<IAFTabViewDelegate> delegate = self.tabItems[indexPath.row];
        UIView *bodyView = [delegate contentViewForIAFTabView:self.tabView];
        [cell setBodyView:bodyView];
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = (scrollView.contentOffset.x + (scrollView.bounds.size.width/2)) / scrollView.bounds.size.width;
    self.currentIndex = index;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.itemSize;
}

@end
