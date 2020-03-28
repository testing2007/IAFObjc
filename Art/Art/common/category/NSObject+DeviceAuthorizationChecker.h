//
//  NSObject+DeviceAuthorizationChecker.h
//  Runner
//
//  Created by apple on 2019/9/25.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceAuthorizationChecker)

/**
 校验相册权限
 */
+ (void)checkPhotoAuthorization:(void (^)(BOOL auth))result;

/**
 校验相机权限
 */
+ (void)checkCameraAuthorization:(void (^)(BOOL auth))result;

/**
 校验麦克风权限
 */
+(void)checkMicrophoneAuthorization:(void (^)(BOOL auth))result;
        
@end

NS_ASSUME_NONNULL_END
