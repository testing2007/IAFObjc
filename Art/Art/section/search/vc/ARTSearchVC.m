//
//  ARTSearchVC.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTSearchVC.h"
#import "ARTSearchCCell.h"
#import "IAFSearchView.h"

@interface ARTSearchVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;
@property (nonatomic, strong) NSMutableArray  *historySearchArr;
@property (nonatomic, strong) IAFSearchView  *searchView;

@end

@implementation ARTSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self initialize];
    
    [self installNaviBar];
    
    [self installUI];
    
    [self loadData];
}

- (void)initialize {
    self.historySearchArr = [[NSMutableArray alloc] initWithArray:@[@"aaaaaaaaaaaaAAAAAAAAA", @"FDFDFDFFFFFFFFFFFFFFFFFFF", @"AAAAAAAAFFFFFFFFFFFF", @"SSDFDFDFFEFEF", @"F", @"FFEFEFE", @"SSSSS", @"SSS", @"BBBB", @"DDDDDDDDDDDD", @"我是苏", @"集团及附近哦 i", @"天际通笔记哦便利", @"dfdfrgbg", @"fdffrfrfr烦人烦人烦人", @"方式", @"史蒂夫", @"奋斗奋斗"]];
}

- (IAFSearchView*)searchView {
    if(_searchView == nil) {
        _searchView = [[IAFSearchView alloc] init];
    }
    return _searchView;
}

- (void)installNaviBar {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchView];
    UIBarButtonItem *barSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barSpace.width = 8;
    UIBarButtonItem *barSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barSpace2.width = -6;
    self.navigationItem.leftBarButtonItems = @[rightItem, barSpace];
}

- (void)installUI {
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.left.right.offset(0);
        make.bottom.offset(K_BOTTOM_SAFE_OFFSET);
    }];
}

- (void)loadData {
//        NSArray *arrText =
}

- (UICollectionView *)collectionView {
    
    if(_collectionView  == nil) {
            
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.estimatedItemSize = CGSizeMake(K_SCREEN_WIDTH, 100);
        layout.itemSize = CGSizeMake(K_SCREEN_WIDTH, 200);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
//        _collectionView.pagingEnabled = true;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        [_collectionView registerClass:ARTSearchCCell.class forCellWithReuseIdentifier:ARTSearchCCell.description];
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
    ARTSearchCCell *cell = (ARTSearchCCell*)[collectionView dequeueReusableCellWithReuseIdentifier:ARTSearchCCell.description forIndexPath:indexPath];

    cell.removeHistoryBlock = ^{
        [self.historySearchArr removeAllObjects];
        [self.collectionView reloadData];
    };
    
    if(indexPath.row == 0 && self.historySearchArr.count > 0) {
        [cell setTexts:self.historySearchArr];
    }
    
    return cell;
}

@end
