//
//  ARTBaseRootVC.m
//  Art
//
//  Created by ZhiQiang wei on 2020/4/1.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTBaseRootVC.h"

@interface ARTBaseRootVC ()

@end

@implementation ARTBaseRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self installNavigationBar];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)installNavigationBar {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
     self.navigationController.navigationBar.translucent = YES;
    
    if(self.navibackgroundView == nil) {
        UIView *navibackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, K_NAVIGATION_BAR_OFFSET)];
        [self.view insertSubview:navibackgroundView atIndex:0];
        navibackgroundView.backgroundColor = [UIColor colorWithHex:0x38ADFF];
        self.navibackgroundView = navibackgroundView;
    }
}

@end
