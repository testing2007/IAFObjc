//
//  ARTBaseRootVC.h
//  Art
//
//  Created by ZhiQiang wei on 2020/4/1.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARTBaseRootVC : ARTBaseVC

@property (nonatomic, weak) UIView *navibackgroundView;
- (void)installNavigationBar;

@end

NS_ASSUME_NONNULL_END
