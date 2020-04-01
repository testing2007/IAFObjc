//
//  IAFTabContentCCell.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/28.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFTabContentCCell.h"

@implementation IAFTabContentCCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)setBodyView:(UIView*)bodyView {
    for (UIView *itemView in self.contentView.subviews) {
        [itemView removeFromSuperview];
    }
    
    [self.contentView addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

@end
