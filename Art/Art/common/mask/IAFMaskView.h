//
//  IAFMaskView.h
//  Art
//
//  Created by ZhiQiang wei on 2020/3/31.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class IAFMaskView;

typedef enum : NSUInteger {
    IAFMaskViewTypeNoNetwork,
    IAFMaskViewTypeLoadFailed,
    IAFMaskViewTypeNoData,
    IAFMaskViewTypeNoLogin,
} IAFMaskViewType;

typedef enum : NSUInteger {
    IAFButtonMaskViewTypeNoLogin,
} IAFButtonMaskViewType;

typedef enum : NSUInteger {
    IAFLoadingMaskViewTypeNormal,
} IAFLoadingMaskViewType;

@interface UIView (MaskView)

// Loading Mask
- (void)installLoadingMaskView;
- (void)installLoadingMaskViewWithInset:(UIEdgeInsets)inset;

// Normal Mask
- (void)installMaskView:(IAFMaskViewType)type;
- (void)installMaskView:(IAFMaskViewType)type andInset:(UIEdgeInsets)inset;

// Button Mask
- (void)installMaskView:(IAFButtonMaskViewType)type buttonBlock:(void (^)(void))buttonBlock;
- (void)installMaskView:(IAFButtonMaskViewType)type andInset:(UIEdgeInsets)inset buttonBlock:(void (^)(void))buttonBlock;

// Remove
- (void)removeMaskView;

@end


NS_ASSUME_NONNULL_END
