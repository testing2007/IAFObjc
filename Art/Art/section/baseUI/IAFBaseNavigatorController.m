//
//  IAFBaseNavigatorController.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFBaseNavigatorController.h"

@interface IAFBaseNavigatorController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation IAFBaseNavigatorController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.delegate = self;
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

//    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
    // Do any additional setup after loading the view.
    
    // 设置 navigationBar 颜色
    [self.navigationBar setBackgroundImage:[UIImage imageFromColor:[UIColor colorWithHex:0x38ADFF] frame:CGRectMake(0, 0, 1, 1)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageFromColor:[UIColor colorWithHex:0x38ADFF] frame:CGRectMake(0, 0, 1, 1)]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationBar.translucent = true;
    
    [self.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"返回-白"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"返回-白"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

#pragma mark - UINavigationControllerDelegate

// 隐藏导航栏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[viewController class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

#pragma mark -  UIGestureRecognizerDelegate
// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

@end
