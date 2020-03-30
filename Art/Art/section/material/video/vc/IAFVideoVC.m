//
//  IAFVideoVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFVideoVC.h"
#import "IAFTabViewDelegate.h"

@interface IAFVideoVC ()<IAFTabViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView  *tableView;

@end

@implementation IAFVideoVC

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
    
    [self setupRefresh];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@--viewWillAppear", NSStringFromClass(self.class));
}

- (void)installUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
}

- (void)setupRefresh {
    
    Weak(weakSelf);
    [_tableView iaf_setHeaderRefreshBlock:^{
        [weakSelf pullDownLoadData];
    }];
    
    [_tableView iaf_setFootterRefreshBlock:^{
        [weakSelf pullUpLoadData];
    }];
    [self.tableView iaf_beginHeaderRefresh];
}

- (void)pullDownLoadData {
    Weak(weakSelf);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
        
        [weakSelf.tableView iaf_endHeaderRefresh];
    });
}

- (void)pullUpLoadData {
    Weak(weakSelf);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
        
        [weakSelf.tableView iaf_endFooterRefresh];
    });
}
                    
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 40;
        _tableView.backgroundColor = [UIColor colorWithHex:0xf6f8fc];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell description]];
//        [_tableView registerClass:[BXGNoteAllNotesHeadView class] forHeaderFooterViewReuseIdentifier:@"head"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }return _tableView;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell description] forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

#pragma mark -- IAFTabViewDelegate
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell {
    return @"视频";
}

-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView {
    return self.view;
}

@end
