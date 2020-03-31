//
//  IAFTabHeaderView.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFTabHeaderView.h"
#import "IAFTabHeaderCCell.h"

#define K_THRESHOLD_TAB_SIZE 5

@interface IAFTabHeaderView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;

@property (nonatomic, weak) NSArray   *tabItems;
@property (nonatomic, weak) IAFTabView *tabView;

@property (nonatomic, copy) DidChangeIndexBlockType  didChangeIndexBlock;

@property (nonatomic, assign) NSInteger  currentIndex;


@end

@implementation IAFTabHeaderView


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
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _flowLayout = layout;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
        [_collectionView registerClass:IAFTabHeaderCCell.class forCellWithReuseIdentifier:IAFTabHeaderCCell.description];
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.showsHorizontalScrollIndicator = false;

        
    }
    return _collectionView;
}

- (void)setCurrentIndex:(NSInteger)newIndex {
    if(_currentIndex == newIndex) {
        return ;
    }
    if(self.didChangeIndexBlock) {
        self.didChangeIndexBlock(newIndex);
    }
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:destinationIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:true];
    _currentIndex = newIndex;
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tabItems.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IAFTabHeaderCCell *cell = (IAFTabHeaderCCell*)([self.collectionView dequeueReusableCellWithReuseIdentifier:IAFTabHeaderCCell.description forIndexPath:indexPath]);
    if(indexPath.row<self.tabItems.count) {
        id<IAFTabViewDelegate> delegate = self.tabItems[indexPath.row];
        NSString *title = [delegate titleForIAFTabView:self.tabView tabViewCell:cell];
        [cell setTitle: title isSelected:self.currentIndex==indexPath.row];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.currentIndex = indexPath.row;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    IAFTabHeaderCCell *cell = (IAFTabHeaderCCell*)([self.collectionView dequeueReusableCellWithReuseIdentifier:IAFTabHeaderCCell.description forIndexPath:indexPath]);

    CGSize itemSize = CGSizeZero;
    NSInteger count = self.tabItems.count >K_THRESHOLD_TAB_SIZE ? K_THRESHOLD_TAB_SIZE : self.tabItems.count;
    itemSize.width = K_SCREEN_WIDTH/count;
    itemSize.height = self.superview.height;
    return itemSize;
}

@end
