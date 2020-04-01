//
//  ARTBaseVC.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTBaseVC.h"

@interface ARTBaseVC ()

@end

@implementation ARTBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@--viewWillAppear", NSStringFromClass([self class]));
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%@--viewWillDisappear", NSStringFromClass([self class]));
}

- (void)popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion {
    if(self.navigationController && self.navigationController.viewControllers.count>1) {
        if(self.presentedViewController) {
            [self.navigationController dismissViewControllerAnimated:animated completion:completion];
        } else {
            [self.navigationController popViewControllerAnimated:animated];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
