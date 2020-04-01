//
//  IAFSearchView.m
//  Art
//
//  Created by ZhiQiang wei on 2020/4/1.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFSearchView.h"
#import "IAFSearchBar.h"

@interface IAFSearchView ()<UISearchBarDelegate>

@property (nonatomic, strong) IAFSearchBar  *searchBar;
@property (nonatomic, strong) UIButton  *cancelBtn;


@end

@implementation IAFSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self installUI];
    }
    return self;
}

- (void)installUI {
    [self addSubview:self.searchBar];
    [self addSubview:self.cancelBtn];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.height.equalTo(@(28));
    }];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_searchBar.mas_right).offset(10);
        make.right.offset(-10);
        make.bottom.offset(0);
        make.centerY.equalTo(self->_searchBar.mas_centerY);
        make.width.equalTo(@(30));
    }];
}

- (IAFSearchBar*)searchBar {
    if(_searchBar == nil) {
        _searchBar = [[IAFSearchBar alloc] init];
        [_searchBar setImage:[UIImage imageNamed:@"搜索-搜索"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setPositionAdjustment:UIOffsetMake(5, 0) forSearchBarIcon:UISearchBarIconSearch];
        [_searchBar setImage:[UIImage imageNamed:@"搜索-清除"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        _searchBar.backgroundImage = [[UIImage alloc] init];//设置背景图是为了去掉上下黑线

        _searchBar.tintColor = [UIColor colorWithHex:0xFFFFFF];//光标颜色
        _searchBar.returnKeyType = UIReturnKeySearch;
        _searchBar.enablesReturnKeyAutomatically = false;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

-(UIButton*)cancelBtn {
    if(_cancelBtn == nil) {
    _cancelBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn addTarget:self action:@selector(onCancelSearch) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn.titleLabel setFont:[UIFont bxg_fontRegularWithSize:15]];
    [_cancelBtn setTitleColor:[UIColor colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
    }
    return _cancelBtn;
}

- (void)onCancelSearch {
    [self.searchBar resignFirstResponder];
}

#pragma mark -- UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return true;
}

@end
