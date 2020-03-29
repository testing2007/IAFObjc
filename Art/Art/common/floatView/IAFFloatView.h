//
//  IAFFloatView.h
//  Art
//
//  Created by ZhiQiang wei on 2020/3/28.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IAFFloatView : UIView

///顺序：top, left, bottom, right
@property (nonatomic, assign) UIEdgeInsets  padding;

///横向 / 纵向间距
@property (nonatomic, assign) CGSize spaceBetweenSize;
///item最大宽度
@property (nonatomic, assign) NSInteger itemMaxWidth;
///item 高度
//@property (nonatomic, assign) NSInteger itemHeight;

///最大显示函数, 默认 0 表示没有限制
@property (nonatomic, assign) NSInteger maxShowLines;


@end

NS_ASSUME_NONNULL_END
