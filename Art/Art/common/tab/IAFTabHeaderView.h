//
//  IAFTabHeaderView.h
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAFTabViewDelegate.h"
#import "IAFTabView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DidChangeIndexBlockType)(NSInteger index);

@interface IAFTabHeaderView : UIView

- (instancetype)initTabItems:(NSArray <id<IAFTabViewDelegate>> *)tabItems
                     tabView:(IAFTabView*)tabView
         didChangeIndexBlock:(DidChangeIndexBlockType)didChangeIndexBlock;

- (void)setCurrentIndex:(NSInteger)newIndex;

@end

NS_ASSUME_NONNULL_END
