//
//  UIFont+Extension.h
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Extension)

/// PingFangSC-Regular
+ (UIFont *)bxg_fontRegularWithSize:(CGFloat)fontSize;

/// PingFangSC-Medium
+ (UIFont *)bxg_fontMediumWithSize:(CGFloat)fontSize;

/// PingFangSC-Semibold
+ (UIFont *)bxg_fontSemiboldWithSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
