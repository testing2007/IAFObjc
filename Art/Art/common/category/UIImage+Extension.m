//
//  UIImage+Extension.m
//  Boxuegu
//
//  Created by HM on 2017/4/13.
//  Copyright © 2017年 ZhiQiang wei All rights reserved.
//

#import "UIImage+Extension.h"
#import <UIKit/UIKit.h>

@implementation UIImage (Extension)

+ (instancetype)imageFromColor:(UIColor *)color frame:(CGRect)frame {
    
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, frame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+(instancetype)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

+ (instancetype)getImageFormView:(UIView *)view frame:(CGRect)rect {
    CGSize size = view.frame.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

-(UIImage*)scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (NSData *)imageData {
    NSData *data = nil;
    if ( UIImagePNGRepresentation(self)==nil) {
        data = UIImageJPEGRepresentation(self, 1);
    }else{
        data = UIImagePNGRepresentation(self);
    }
    return data;
}

@end
