//
//  IAFFloatView.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/28.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFFloatView.h"

#define K_SWITCH_TAG_BTN 1000

@interface IAFFloatView ()
@property (nonatomic, strong) UIButton  *switchBtn;
@property (nonatomic, assign) NSInteger  maxAllowableShowIndex;

@end

@implementation IAFFloatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.padding = UIEdgeInsetsZero;
    self.spaceBetweenSize = CGSizeMake(5, 10);
    self.maxShowLines = 0;
    self.itemMaxWidth = 100;
    self.maxAllowableShowIndex = 0;
    
    [self addSubview:self.switchBtn];
}

- (UIButton *)switchBtn {
    if(_switchBtn == nil) {
        _switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_switchBtn setTitle:@"开" forState:UIControlStateNormal];
        _switchBtn.selected = false;
        [_switchBtn setHidden:YES];
        _switchBtn.tag = K_SWITCH_TAG_BTN;
        _switchBtn.titleLabel.font = [UIFont bxg_fontRegularWithSize:14];
        [_switchBtn addTarget:self action:@selector(onSwitchBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchBtn;
}

- (void)onSwitchBtn:(UIButton*)sender {
    _switchBtn.selected = !_switchBtn.selected;
    if(_switchBtn.selected) {
        [_switchBtn setTitle:@"关" forState:UIControlStateNormal];
    } else {
        [_switchBtn setTitle:@"开" forState:UIControlStateNormal];
    }
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self layoutSubviewForSize:size];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutSubviewForSize:self.bounds.size];
}

- (CGSize)layoutSubviewForSize:(CGSize)boundSize {
    
    CGSize retSize = boundSize;
    
    CGPoint ptOrigin = CGPointMake(self.padding.left, self.padding.top);
    CGPoint ptEnd = CGPointMake(self.width-self.padding.right, self.padding.top);
    CGPoint ptPrev = ptOrigin;
    CGPoint ptNext = ptOrigin;
    CGPoint ptCur = ptOrigin;
    int breaklineTimes = 1;
    UIView *prevView = nil;
    UIView *lastShowView = nil;
    
    int i = 0;
    for (UIView *subview in self.subviews) {
        if([subview isKindOfClass:[UIButton class]] && subview.tag == K_SWITCH_TAG_BTN) {
            i += 1;
            continue;
        }
        [subview sizeToFit];
        
        if(subview.width > self.itemMaxWidth) {
            //subview的宽度 大于 最大宽度
            subview.width = self.itemMaxWidth;
        }
        ptCur = ptNext;
        CGRect rcItem = CGRectMake(ptCur.x, ptCur.y, subview.width, subview.height);
        if ((rcItem.origin.x+rcItem.size.width) > ptEnd.x-(20+5)) {
            //如果这个元素越过了边界，换行处理
            breaklineTimes += 1;
            ptCur.x = ptOrigin.x;
            ptCur.y = ptPrev.y+subview.height+self.spaceBetweenSize.height;
            
            if([self isNeedHiddenSwitchBtnWithSumBreaklineTimes:breaklineTimes]) {
                
                [subview setFrame:CGRectMake(ptCur.x, ptCur.y, rcItem.size.width, rcItem.size.height)];
                
                subview.hidden = true;
                
                if(self.switchBtn.hidden) {
                    self.maxAllowableShowIndex = i;
                    [self.switchBtn setFrame:CGRectMake(ptEnd.x-(20+5), prevView.y, 20, 20)];
                    self.switchBtn.hidden = false;
                }
                if (![self isNeedHiddenItemWithItemIndex:i]) {
                    lastShowView = prevView;
                }
            } else {
                [subview setFrame:CGRectMake(ptCur.x, ptCur.y, rcItem.size.width+(20+5), rcItem.size.height)];
                subview.hidden = [self isNeedHiddenItemWithItemIndex:i];
            }
            
        } else {
            [subview setFrame:rcItem];
            subview.hidden = [self isNeedHiddenItemWithItemIndex:i];
        }
        ptCur.x = subview.x;
        ptCur.y = subview.y;
        ptPrev  = ptCur;
        ptNext = CGPointMake(subview.right+self.spaceBetweenSize.width, subview.y);
        
        prevView = subview;
        
        i += 1;
    }
    
    lastShowView = lastShowView ? lastShowView : prevView;
    
    retSize = CGSizeMake(self.width, lastShowView ? lastShowView.bottom+self.padding.bottom : 0);
    
    return retSize;
}

- (BOOL)isNeedHiddenSwitchBtnWithSumBreaklineTimes:(NSInteger)sumBreaklineTimes {
    if(self.maxShowLines != 0 && !self.switchBtn.isSelected && sumBreaklineTimes>self.maxShowLines) {
        return true;
    } else {
        return false;
    }
}

- (BOOL)isNeedHiddenItemWithItemIndex:(NSInteger)itemIndex {
    if(self.maxShowLines != 0 && !self.switchBtn.isSelected && itemIndex>self.maxAllowableShowIndex) {
        return true;
    } else {
        return false;
    }
}

@end
