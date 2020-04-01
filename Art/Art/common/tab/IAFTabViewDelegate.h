//
//  IAFTabItemViewDelegate.h
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@class IAFTabView;
@class IAFTabHeaderCCell;
@protocol IAFTabViewDelegate <NSObject>

@required
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell;
-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView;

@optional
-(void)IAFTableView:(IAFTabView*)tabView didSelectIndex:(NSInteger)index;
-(void)IAFTableView:(IAFTabView*)tabView scrollToIndex:(NSInteger)toIndex;

//从左边滑出 -- 用户tab嵌套
-(void)IAFTableView:(IAFTabView*)tabView isScrollOutFromBegin:(BOOL)outFromBegin;
//从右边滑出 -- 用户tab嵌套
-(void)IAFTableView:(IAFTabView*)tabView isScrollOutFromEnd:(BOOL)outFromEnd;


@end

NS_ASSUME_NONNULL_END
