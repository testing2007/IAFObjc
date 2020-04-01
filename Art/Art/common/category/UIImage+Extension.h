//
//  UIImage+Extension.h
//  Boxuegu
//
//  Created by HM on 2017/4/13.
//  Copyright © 2017年 ZhiQiang wei All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/**
 获得指定颜色值的UIImage
 */
+ (instancetype)imageFromColor:(UIColor *)color frame:(CGRect)frame;

/**
 生成高斯模糊UIImage
 */
+(instancetype)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 或等指定UIView中的界面
 */
+ (instancetype)getImageFormView:(UIView *)view frame:(CGRect)rect;


/**
 裁剪

 @param image 原图片
 @param newSize 新大小
 @return 新图片
 */
- (UIImage*)scaledToSize:(CGSize)newSize;
- (NSData *)imageData;
@end
