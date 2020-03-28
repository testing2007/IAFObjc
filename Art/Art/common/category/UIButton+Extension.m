//
//  UIButton+Extension.m
//  Boxuegu
//
//  Created by HM on 2017/5/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
//-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
//
//    self.enabled = false;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.enabled = true;
//    });
//    
//    [super sendAction:action to:target forEvent:event];
//}

-(void)animationImage:(UIImage*)image bZoomIn:(BOOL)bZoomIn andCompletionBlock:(void (^)())completionBlock
{
    [UIView animateWithDuration:1.0f animations:^{
        [self setImage:image forState:UIControlStateNormal];
        if(bZoomIn)
        {
            self.transform = CGAffineTransformScale(self.transform, 2.0, 2.0);
        }
        else
        {
            self.transform = CGAffineTransformScale(self.transform, 0.5, 0.5);
        }
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
        if(completionBlock)
        {
            completionBlock();
        }
    }];
}


- (void)setIconRightWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + Spacing / 2),
        .bottom = 0,
        .right  =   (img_W + Spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + Spacing / 2),
        .bottom = 0,
        .right  = - (tit_W + Spacing / 2),
    };
}

@end
