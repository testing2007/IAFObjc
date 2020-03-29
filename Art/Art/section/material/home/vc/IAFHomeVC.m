//
//  IAFHomeVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFHomeVC.h"
#import "IAFTabViewDelegate.h"
#import "IAFSearchVC.h"

@interface IAFHomeVC ()<IAFTabViewDelegate>
@property (nonatomic, strong) UIButton  *searchBtn;
@property (nonatomic, strong) UILabel  *testLabel;

@end

@implementation IAFHomeVC

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self installUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@--viewWillAppear", NSStringFromClass(self.class));
}

- (UIButton *)searchBtn {
    
    if(_searchBtn == nil) {
        
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setTitle:@"searchVC" forState:UIControlStateNormal];
        _searchBtn.titleLabel.font = [UIFont bxg_fontRegularWithSize:14];
        [_searchBtn addTarget:self action:@selector(onSearchVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

-(UILabel*)testLabel {
    if(_testLabel == nil) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.text = @"testLabel";
        _testLabel.textAlignment = NSTextAlignmentLeft;
        _testLabel.font = [UIFont bxg_fontMediumWithSize:15];
        _testLabel.textColor = [UIColor colorWithHex:0x999999];
        _testLabel.backgroundColor = [UIColor randomColor];
        _testLabel.layer.borderColor = [UIColor colorWithHex:0x880000].CGColor;
        _testLabel.layer.masksToBounds = true;
        _testLabel.layer.cornerRadius = 5;
        _testLabel.userInteractionEnabled = true;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapLabel:)];
        [_testLabel addGestureRecognizer:tap];
    }
    return _testLabel;
}

-(void)onTapLabel:(UIGestureRecognizer*)ges {
    NSLog(@"%@ onTapLabel", NSStringFromClass([IAFHomeVC class]));
}

- (void)onSearchVC:(UIButton*)btn {
    IAFSearchVC *vc = [[IAFSearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)installUI {
    [self.view addSubview:self.searchBtn];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.width.height.equalTo(@(100));
    }];
    [self.view addSubview:self.testLabel];
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBtn.mas_bottom).offset(10);
        make.centerX.offset(0);
        make.width.equalTo(@(100));
        make.height.equalTo(@(80));
    }];
}

#pragma mark -- IAFTabViewDelegate
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell {
    return @"首页";
}

-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView {
    return self.view;
}



@end
