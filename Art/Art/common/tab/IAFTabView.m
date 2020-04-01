//
//  IAFTabView.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFTabView.h"
#import "IAFTabViewDelegate.h"
#import "IAFTabHeaderView.h"
#import "IAFTabContentView.h"

@interface IAFTabView ()

@property (nonatomic, strong) NSArray  *tabItems;
@property (nonatomic, assign) NSInteger  tabHeaderHeight;

@property (nonatomic, strong) IAFTabHeaderView  *headerView;
@property (nonatomic, strong) IAFTabContentView  *contentView;


@end

@implementation IAFTabView

- (instancetype)initWithTabItems:(NSArray <id<IAFTabViewDelegate>> *)tabItems tabHeaderHeight:(NSInteger)tabHeaderHeight {
    self = [super init];
    if(self) {
        _tabItems = [NSArray arrayWithArray:tabItems];
        _tabHeaderHeight = tabHeaderHeight;
        [self installUI];
    }
    return self;
}

- (void)installUI {
    [self addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.equalTo(@(self.tabHeaderHeight));
    }];
    
    UIView *sepView = [[UIView alloc] init];
    sepView.backgroundColor = [UIColor colorWithHex:0xF5F5F5];
    [self addSubview:sepView];
    [sepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.headerView.mas_bottom);
        make.height.equalTo(@(8));
    }];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sepView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
}

- (UIView*)headerView {
    if(_headerView == nil) {
        Weak(weakSelf)
        _headerView = [[IAFTabHeaderView alloc] initTabItems:self.tabItems tabView:self didChangeIndexBlock:^(NSInteger index) {
            [weakSelf.contentView setCurrentIndex:index];
        }];
    }
    return _headerView;
}

- (UIView*)contentView {
    if(_contentView == nil) {
        Weak(weakSelf)
        _contentView = [[IAFTabContentView alloc] initTabItems:self.tabItems tabView:self didChangeIndexBlock:^(NSInteger index) {
            [weakSelf.headerView setCurrentIndex:index];
        }];
    }
    return _contentView;
}





@end
