//
//  IAFHomeVC.h
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface IAFHomeVC : IAFBaseVC

@property (nonatomic, copy) void (^upScrollBlock)(void);
@property (nonatomic, copy) void (^downScrollBlock)(void);

@end

NS_ASSUME_NONNULL_END
