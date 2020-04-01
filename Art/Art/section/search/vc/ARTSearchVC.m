//
//  ARTSearchVC.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFSearchView.h"
#import "ARTSearchVC.h"
#import "ARTSearchHistoryCCell.h"
#import "ARTSearchResultView.h"
#import "ARTSearchRecommendView.h"

@interface ARTSearchVC ()<UICollectionViewDelegate>

@property (nonatomic, strong) IAFSearchView  *searchView;
@property (nonatomic, strong) ARTSearchResultView  *resultView;
@property (nonatomic, strong) ARTSearchRecommendView  *recommendView;

@end

@implementation ARTSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self installNaviBar];
    
    [self installUI];
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
    [self.view addSubview:self.resultView];
    [self.view addSubview:self.recommendView];
    
    [self.resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.bottom.offset(-K_BOTTOM_SAFE_OFFSET);
    }];
    [self.recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.bottom.offset(-K_BOTTOM_SAFE_OFFSET);
    }];
    
    [self.recommendView setHidden:YES];
}

- (IAFSearchView*)searchView {
    if(_searchView == nil) {
        _searchView = [[IAFSearchView alloc] init];
        _searchView.delegate = self;
    }
    return _searchView;
}

- (ARTSearchResultView*)resultView {
    if(_resultView == nil) {
        _resultView = [[ARTSearchResultView alloc] init];
    }
    return _resultView;
}

- (ARTSearchRecommendView*)recommendView  {
    if(_recommendView == nil) {
        _recommendView = [[ARTSearchRecommendView alloc] init];
    }
    return _recommendView;
}

#pragma mark IAFSearchViewDelegate
- (void)searchViewTextDidBeginEditing {
    NSLog(@"searchViewTextDidBeginEditing");
    [self.recommendView setHidden:false];
    
}

- (void)searchViewTextDidEndEditingKeywork:(NSString*)keyword {
    NSLog(@"searchViewTextDidEndEditingKeywork");
}

- (void)searchViewSearchButtonClicked:(NSString*)keyword {
    NSLog(@"searchViewSearchButtonClicked");
    [self.recommendView setHidden:true];
}

- (void)searchViewCancelButtonClicked {
    NSLog(@"searchViewCancelButtonClicked");
    [self popViewControllerAnimated:true completion:nil];
}

@end
