//
//  UIScrollView+IAFRefreshTool.h
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (IAFRefreshTool)

- (void)iaf_setHeaderRefreshBlock:(void (^)(void))headerRefreshBlock;
- (void)iaf_beginHeaderRefresh;
- (void)iaf_endHeaderRefresh;

- (void)iaf_setFootterRefreshBlock:(void (^)(void))footerRefreshBlock;
- (void)iaf_beginFootRefresh;
- (void)iaf_endFooterRefresh;
- (void)iaf_endFooterRefreshNoMoreData;

@end

NS_ASSUME_NONNULL_END
