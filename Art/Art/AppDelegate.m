//
//  AppDelegate.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/28.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "AppDelegate.h"
#import "section/mainTabbar/IAFMainTabBarVC.h"

@interface AppDelegate ()
@property (nonatomic, strong) IAFMainTabBarVC *mainTabBarVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.mainTabBarVC = [[IAFMainTabBarVC alloc] init];
    
    self.window.rootViewController = self.mainTabBarVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
