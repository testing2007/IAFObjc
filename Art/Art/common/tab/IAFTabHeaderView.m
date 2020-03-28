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

@interface IAFTabHeaderView ()<UICollectionViewDelegate, UICollectionViewDataSource>

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
        
        layout.itemSize = self.itemSize;
        
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

        
//        Weak(weakSelf);
//        [_collectionView bxg_setHeaderRefreshBlock:^{
//            [weakSelf loadDataWithIsRefresh:true];
//        }];
    }
    return _collectionView;
}

- (CGSize)itemSize {
    if(CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        NSInteger count = self.tabItems.count >K_THRESHOLD_TAB_SIZE ? K_THRESHOLD_TAB_SIZE : self.tabItems.count;
        _itemSize.width = K_SCREEN_WIDTH/count;
        _itemSize.height = 80;
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

        CGFloat offsetX = 0;
        BOOL isTowardToRight = newIndex-oldIndex;
        NSInteger maxAllowableOffseXCount = self.tabItems.count-K_THRESHOLD_TAB_SIZE;
        if(newIndex<K_THRESHOLD_TAB_SIZE/2) {
            
            //做不处理操作
            
        } else if(newIndex<maxAllowableOffseXCount) {
            
            NSInteger startIndex = K_THRESHOLD_TAB_SIZE%2==0 ? K_THRESHOLD_TAB_SIZE/2 : K_THRESHOLD_TAB_SIZE/2+1;
            offsetX = (newIndex-startIndex+1)*self.itemSize.width;
            
        } else {
            CGFloat maxOffsetX = maxAllowableOffseXCount * self.itemSize.width;
            offsetX = maxOffsetX;
        }
        
        [self.collectionView setContentOffset:CGPointMake( offsetX<0 ? 0 : offsetX, 0) animated:false];

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

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSInteger index = (scrollView.contentOffset.x + (self.itemSize.width/2)) / self.itemSize.width;
////    NSLog(@"scrollView.contentOffset.x=%lf", scrollView.contentOffset.x);
//    self.currentIndex = index;
//}

@end