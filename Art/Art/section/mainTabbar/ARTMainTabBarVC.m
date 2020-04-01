//
//  ARTMainTabBarVC.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTMainTabBarVC.h"

#import "ARTBaseNavigatorController.h"

#import "ARTMaterialVC.h"
#import "ARTPrepareVC.h"
#import "ARTDiscoverVC.h"
#import "ARTMeVC.h"

@interface ARTMainTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation ARTMainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self loadMainLayout];
}

-(void)loadMainLayout {
    NSLog(@"%@ -- load", NSStringFromClass([self class]));
    
    UINavigationController *materialNavVC = [self loadTabItemClasses:@"ARTMaterialVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *prepareVC = [self loadTabItemClasses:@"ARTPrepareVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *discoverVC = [self loadTabItemClasses:@"ARTDiscoverVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *meVC = [self loadTabItemClasses:@"ARTMeVC" unselectImageName:@"" selectedImageName:@""];
    
    self.viewControllers = @[materialNavVC, prepareVC, discoverVC, meVC];
    
    self.selectedIndex = 0;
}

- (UINavigationController*)loadTabItemClasses:(NSString*)className unselectImageName:(NSString*)unselectImageName selectedImageName:(NSString*)selectedImageName {
        
    Class class = NSClassFromString(className);
    
    ARTBaseVC *baseVC = [[class alloc] init];
//    baseVC.title = className;
    ARTBaseNavigatorController *materialNav = [[ARTBaseNavigatorController alloc] initWithRootViewController:baseVC];
    materialNav.tabBarItem.title = className;
    
    // materialNav.tabBarItem.image = [UIImage "未选中"]
    // materialNav.tabBarItem.selectedImage = [UIImage "选中"]
    return materialNav;
}

@end
