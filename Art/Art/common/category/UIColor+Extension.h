//
//  UIColor+Extension.h
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

+ (instancetype)colorWithHex:(uint32_t)hex;
+ (instancetype)randomColor;
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
+ (instancetype)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;
+ (instancetype)themeColor;
+ (instancetype)transparentColor;
- (UIImage*)convertImage;



@end

NS_ASSUME_NONNULL_END
