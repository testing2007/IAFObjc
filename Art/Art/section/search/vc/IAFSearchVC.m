//
//  IAFSearchVC.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFSearchVC.h"
#import "IAFSearchCCell.h"

@interface IAFSearchVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;
@end

@implementation IAFSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self installUI];
}

- (void)installUI {
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.left.right.offset(0);
        make.bottom.offset(K_BOTTOM_SAFE_OFFSET);
    }];
}

- (UICollectionView *)collectionView {
    
    if(_collectionView  == nil) {
            
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.pagingEnabled = true;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        [_collectionView registerClass:IAFSearchCCell.class forCellWithReuseIdentifier:IAFSearchCCell.description];
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.showsHorizontalScrollIndicator = false;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IAFSearchCCell *cell = (IAFSearchCCell*)[collectionView dequeueReusableCellWithReuseIdentifier:IAFSearchCCell.description forIndexPath:indexPath];

    NSArray *arrText = @[@"aaaaaaaaaaaaAAAAAAAAA", @"FDFDFDFFFFFFFFFFFFFFFFFFF", @"AAAAAAAAFFFFFFFFFFFF", @"SSDFDFDFFEFEF", @"F", @"FFEFEFE", @"SSSSS", @"SSS", @"BBBB", @"DDDDDDDDDDDD", @"我是苏", @"集团及附近哦 i", @"天际通笔记哦便利", @"dfdfrgbg", @"fdffrfrfr烦人烦人烦人", @"方式", @"史蒂夫", @"奋斗奋斗"];
    [cell setTexts:arrText];

    return cell;
}

@end
