//
//  UIScrollView+IAFRefreshTool.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFRefreshTool.h"
#import "IAFRefreshHeader.h"
#import "IAFRefreshFooter.h"

@implementation UITableView (IAFRefreshTool)

- (void)iaf_setHeaderRefreshBlock:(void (^)(void))headerRefreshBlock {
    self.mj_header = [IAFRefreshHeader headerWithRefreshingBlock:^{
        if(headerRefreshBlock) {
            headerRefreshBlock();
        }
    }];
}

- (void)iaf_beginHeaderRefresh {
    // 马上进入刷新状态
    [self.mj_header beginRefreshing];
}

- (void)iaf_endHeaderRefresh {
    [self.mj_header endRefreshing];
}

- (void)iaf_setFootterRefreshBlock:(void (^)(void))footerRefreshBlock {
    self.mj_footer = [IAFRefreshFooter footerWithRefreshingBlock:^{
        if(footerRefreshBlock) {
            footerRefreshBlock();
        }
    }];
}

- (void)iaf_beginFootRefresh {
    [self.mj_footer beginRefreshing];
}

- (void)iaf_endFooterRefresh {
    [self.mj_footer endRefreshing];
}

- (void)iaf_endFooterRefreshNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

@end
