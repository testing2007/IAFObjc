//
//  NSObject+DeviceAuthorizationChecker.m
//  Runner
//
//  Created by apple on 2019/9/25.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NSObject+DeviceAuthorizationChecker.h"
@implementation NSObject (DeviceAuthorizationChecker)

/**
 校验相册权限
 */
+ (void)checkPhotoAuthorization:(void (^)(BOOL auth))result {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0 //iOS 8.0以下使用AssetsLibrary.framework
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    switch (status) {
        case ALAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
            [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                if (*stop) {
                    //允许
                    if (result) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            result(YES);
                        });
                    }
                    return;
                }
                *stop = YES;
            } failureBlock:^(NSError *error) {
                //拒绝
                if (result) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        result(NO);
                    });
                }
            }];
        }
            break;
        case ALAuthorizationStatusRestricted:       //家长控制
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case ALAuthorizationStatusDenied:           //用户拒绝
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case ALAuthorizationStatusAuthorized:       //已授权
        {
            if (result) {
                result(YES);
            }
        }
            break;
        default:
            break;
    }
#else   //iOS 8.0以上使用Photos.framework
    PHAuthorizationStatus current = [PHPhotoLibrary authorizationStatus];
    switch (current) {
        case PHAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    //授权
                    if (result) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            result(YES);
                        });
                    }
                }else {
                    //其他
                    if (result) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            result(NO);
                        });
                    }
                }
            }];
        }
            break;
        case PHAuthorizationStatusRestricted:       //家长控制
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case PHAuthorizationStatusDenied:           //用户拒绝
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case PHAuthorizationStatusAuthorized:       //已授权
        {
            if (result) {
                result(YES);
            }
        }
            break;
        default:
            break;
    }
#endif
}

/**
 校验相机权限
 */
+ (void)checkCameraAuthorization:(void (^)(BOOL auth))result {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {  //授权
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (result) {
                            result(YES);
                        }
                    });
                }else {         //拒绝
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (result) {
                            result(NO);
                        }
                    });
                }
            }];
        }
            break;
        case AVAuthorizationStatusRestricted:       //家长控制
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case AVAuthorizationStatusDenied:           //用户拒绝
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case AVAuthorizationStatusAuthorized:       //已授权
        {
            if (result) {
                result(YES);
            }
        }
            break;
        default:
            break;
    }
}


+(void)checkMicrophoneAuthorization:(void (^)(BOOL auth))result {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
                if (granted) {  //授权
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (result) {
                            result(YES);
                        }
                    });
                }else {         //拒绝
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (result) {
                            result(NO);
                        }
                    });
                }
            }];
        }
            break;
        case AVAuthorizationStatusRestricted:       //家长控制
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case AVAuthorizationStatusDenied:           //用户拒绝
        {
            if (result) {
                result(NO);
            }
        }
            break;
        case AVAuthorizationStatusAuthorized:       //已授权
        {
            if (result) {
                result(YES);
            }
        }
            break;
        default:
            break;
    }
}


@end
