//
//  ARTHomeVC.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTHomeVC.h"
#import "IAFTabViewDelegate.h"

@interface ARTHomeVC ()<IAFTabViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, assign) CGFloat  beginContentOffsetY;


@end

@implementation ARTHomeVC

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
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 40;
        _tableView.backgroundColor = [UIColor colorWithHex:0xf6f8fc];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCell.description];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = FALSE;
        }
    }
    return _tableView;
}

#pragma mark -- IAFTabViewDelegate
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell {
    return @"首页";
}

-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView {
    return self.view;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:UITableViewCell.description forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

#pragma mark -- UIScrollViewDelegate
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    _beginContentOffsetY = scrollView.contentOffset.y;
//}
//
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//    if(_beginContentOffsetY<scrollView.contentOffset.y) {
//        NSLog(@"--向上");
//
//        [super.navigationController setNavigationBarHidden:YES animated:TRUE];
//    } else {
//        NSLog(@"--向下");
//
//        [super.navigationController setNavigationBarHidden:NO animated:TRUE];
//    }
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIPanGestureRecognizer *ges = scrollView.panGestureRecognizer;
    CGFloat velocity = [ges velocityInView:scrollView].y;
    if(velocity < -5) {
        //上滑
        if(self.upScrollBlock) {
            self.upScrollBlock();
        }
    } else if(velocity > 5) {
        //下滑
        if(self.downScrollBlock) {
            self.downScrollBlock();
        }
    }
}

@end
