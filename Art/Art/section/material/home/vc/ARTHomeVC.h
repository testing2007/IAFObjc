//
//  ARTHomeVC.h
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARTHomeVC : ARTBaseVC

@property (nonatomic, copy) void (^upScrollBlock)(void);
@property (nonatomic, copy) void (^downScrollBlock)(void);

@end

NS_ASSUME_NONNULL_END
