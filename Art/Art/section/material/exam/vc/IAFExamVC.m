//
//  IAFExamVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFExamVC.h"
#import "IAFTabViewDelegate.h"

@interface IAFExamVC ()<IAFTabViewDelegate>

@end

@implementation IAFExamVC

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

- (void)installUI {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor randomColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont bxg_fontRegularWithSize:14];
    [btn addTarget:self action:@selector(onTest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.width.height.equalTo(@(100));
    }];
}

-(void)onTest:(UIButton*)btn {
    NSLog(@"i am called");
}

#pragma mark -- IAFTabViewDelegate
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell {
    return @"考试";
}

-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView {
    return self.view;
}

@end
