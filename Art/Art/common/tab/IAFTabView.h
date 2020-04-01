//
//  IAFTabView.h
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAFTabViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface IAFTabView : UIView

- (instancetype)initWithTabItems:(NSArray <id<IAFTabViewDelegate>> *)tabItems tabHeaderHeight:(NSInteger)tabHeight;

@end

NS_ASSUME_NONNULL_END
