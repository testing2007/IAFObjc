//
//  IAFMainTabBarVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFMainTabBarVC.h"

#import "IAFBaseNavigatorController.h"

#import "IAFMaterialVC.h"
#import "IAFPrepareVC.h"
#import "IAFDiscoverVC.h"
#import "IAFMeVC.h"

@interface IAFMainTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation IAFMainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self loadMainLayout];
}

-(void)loadMainLayout {
    NSLog(@"%@ -- load", NSStringFromClass([self class]));
    
    UINavigationController *materialNavVC = [self loadTabItemClasses:@"IAFMaterialVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *prepareVC = [self loadTabItemClasses:@"IAFPrepareVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *discoverVC = [self loadTabItemClasses:@"IAFDiscoverVC" unselectImageName:@"" selectedImageName:@""];
    UINavigationController *meVC = [self loadTabItemClasses:@"IAFMeVC" unselectImageName:@"" selectedImageName:@""];
    
    self.viewControllers = @[materialNavVC, prepareVC, discoverVC, meVC];
    
    self.selectedIndex = 0;
}

- (UINavigationController*)loadTabItemClasses:(NSString*)className unselectImageName:(NSString*)unselectImageName selectedImageName:(NSString*)selectedImageName {
        
    Class class = NSClassFromString(className);
    
    IAFBaseVC *baseVC = [[class alloc] init];
//    baseVC.title = className;
    IAFBaseNavigatorController *materialNav = [[IAFBaseNavigatorController alloc] initWithRootViewController:baseVC];
    materialNav.tabBarItem.title = className;
    
    // materialNav.tabBarItem.image = [UIImage "未选中"]
    // materialNav.tabBarItem.selectedImage = [UIImage "选中"]
    return materialNav;
}

@end
