//
//  IAFBaseNavigatorController.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFBaseNavigatorController.h"

@interface IAFBaseNavigatorController ()<UIGestureRecognizerDelegate>

@end

@implementation IAFBaseNavigatorController

- (instancetype)init {
    
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    self = [super initWithRootViewController:rootViewController];
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.interactivePopGestureRecognizer.delegate = self;
    // Do any additional setup after loading the view.
    
    // 设置 navigationBar 背景色w 为浅蓝色 + 文字title颜色 + 返回按钮的颜色 TODO:可以考虑主题模块统一颜色配置
    [self.navigationBar setBackgroundImage:[UIImage imageFromColor:[UIColor colorWithHex:0x38ADFF] frame:CGRectMake(0, 0, 1, 1)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageFromColor:[UIColor colorWithHex:0x38ADFF] frame:CGRectMake(0, 0, 1, 1)]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationBar.translucent = true;
    
    [self.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"返回-白"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"返回-白"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

#pragma mark -  UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if(self.childViewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = true;
//        self.navigationBarHidden = false;
    }
    
    //一定要放在 viewController.hidesBottomBarWhenPushed 后面再调用 [super push**]
    [super pushViewController:viewController animated:animated];
}

@end
