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

@property (nonatomic, assign) CGSize itemSize;

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

        if (@available(iOS 11.0, *)) {
              _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          }
    }
    return _collectionView;
}

- (CGSize)itemSize {
    if(CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        NSInteger count = self.tabItems.count >K_THRESHOLD_TAB_SIZE ? K_THRESHOLD_TAB_SIZE : self.tabItems.count;
        _itemSize.width = K_SCREEN_WIDTH/count;
        _itemSize.height = self.superview.height;
    }
    return _itemSize;
}

- (void)setCurrentIndex:(NSInteger)newIndex {
    if(_currentIndex == newIndex) {
        return ;
    }
    if(self.didChangeIndexBlock) {
        self.didChangeIndexBlock(newIndex);
    }
    [self scrollToNewIndex:newIndex oldIndex:_currentIndex];
    _currentIndex = newIndex;
    [self.collectionView reloadData];
}

- (void)scrollToNewIndex:(NSInteger)newIndex oldIndex:(NSInteger)oldIndex {
    if(newIndex == oldIndex) {
        return ;
    }
    
    if(self.tabItems.count>K_THRESHOLD_TAB_SIZE) {

        NSInteger maxAllowableOffseX = (self.tabItems.count-K_THRESHOLD_TAB_SIZE)*self.itemSize.width;
        BOOL isTowardToRight = newIndex-oldIndex;
        
        CGFloat curOffsetX =  self.collectionView.contentOffset.x;
        CGFloat newPosX = newIndex*self.itemSize.width;
        CGFloat newOffsetX = 0;
        if(newPosX<=curOffsetX) {
            //说明这个位置在左边界
            if(isTowardToRight) {
                newOffsetX = curOffsetX-(curOffsetX-newPosX-10);
                [self.collectionView setContentOffset:CGPointMake( newOffsetX<0 ? 0 : newOffsetX, 0) animated:false];
            } else {
                //不应该出现这个情况，如果出现， 不处理
            }
        } else {
            CGFloat distanceFromLeftX = newPosX-curOffsetX;
            if(distanceFromLeftX+self.itemSize.width >= self.collectionView.bounds.size.width) {
                //说明所选item在右边界上
                if(isTowardToRight) {
                    //向右
                    CGFloat offsetX = curOffsetX+self.itemSize.width;
                    if(offsetX<self.itemSize.width) {
                        offsetX = self.itemSize.width;
                    }
                    newOffsetX = offsetX>maxAllowableOffseX ? maxAllowableOffseX : offsetX;
                    [self.collectionView setContentOffset:CGPointMake( newOffsetX<0 ? 0 : newOffsetX, 0) animated:false];
                } else {
                    //向左， 不处理
                }
            } else {
                //可视区域，不处理
            }
        }

    } else {
        
        if(newIndex>K_THRESHOLD_TAB_SIZE-1) {
            [self.collectionView setContentOffset:CGPointMake(((newIndex-(K_THRESHOLD_TAB_SIZE-1)) *self.itemSize.width), 0) animated:false];
        } else {
            [self.collectionView setContentOffset:CGPointMake(0, 0) animated:false];
        }
        
    }
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
//    IAFTabHeaderCCell *cell = (IAFTabHeaderCCell*)([self.collectionView dequeueReusableCellWithReuseIdentifier:IAFTabHeaderCCell.description forIndexPath:indexPath]);

    return self.itemSize;
}

@end
