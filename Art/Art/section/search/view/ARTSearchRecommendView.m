//
//  ARTSearchRecommendView.m
//  Art
//
//  Created by ZhiQiang wei on 2020/4/1.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTSearchRecommendView.h"
#import "ARTSearchHistoryCCell.h"

@interface ARTSearchRecommendView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;
@property (nonatomic, strong) NSMutableArray  *historySearchArr;

@end

@implementation ARTSearchRecommendView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self installUI];
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    NSLog(@"willMoveToWindow");
}

- (void)didMoveToSuperview{
    NSLog(@"didMoveToSuperview");
    [self loadData];
//    [self.collectionView reloadData];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    if(!hidden) {
        [self loadData];
    }
}

- (void)loadData {
    [self installLoadingMaskView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self removeMaskView];
        
        self.historySearchArr = [[NSMutableArray alloc] initWithArray:@[@"aaaaaaaaaaaaAAAAAAAAA", @"FDFDFDFFFFFFFFFFFFFFFFFFF", @"AAAAAAAAFFFFFFFFFFFF", @"SSDFDFDFFEFEF", @"F", @"FFEFEFE", @"SSSSS", @"SSS", @"BBBB", @"DDDDDDDDDDDD", @"我是苏", @"集团及附近哦 i", @"天际通笔记哦便利", @"dfdfrgbg", @"fdffrfrfr烦人烦人烦人", @"方式", @"史蒂夫", @"奋斗奋斗"]];
        
        [self.collectionView reloadData];
    });
    
}

- (void)installUI {
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (UICollectionView *)collectionView {
    
    if(_collectionView  == nil) {
            
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(K_SCREEN_WIDTH, 200);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        [_collectionView registerClass:ARTSearchHistoryCCell.class forCellWithReuseIdentifier:ARTSearchHistoryCCell.description];
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.showsHorizontalScrollIndicator = false;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.historySearchArr.count > 0 ? 1 : 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ARTSearchHistoryCCell *cell = (ARTSearchHistoryCCell*)[collectionView dequeueReusableCellWithReuseIdentifier:ARTSearchHistoryCCell.description forIndexPath:indexPath];

    cell.removeAllHistoryBlock = ^{
        [self.historySearchArr removeAllObjects];
        [self.collectionView reloadData];
    };
    
    if(indexPath.row == 0 && self.historySearchArr.count > 0) {
        [cell setHistoryKeywords:self.historySearchArr];
    }
    
    return cell;
}

@end
