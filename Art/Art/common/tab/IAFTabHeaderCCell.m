//
//  IAFTabHeaderCCell.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFTabHeaderCCell.h"


@interface IAFTabHeaderCCell ()

@property (nonatomic, strong, readwrite) UILabel  *titleLabel;
@property (nonatomic, assign) BOOL  selected;

@end

@implementation IAFTabHeaderCCell
@synthesize selected = _isSelected;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self installUI];
    }
    return self;
}

- (void)installUI {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
        make.center.offset(0);
    }];
}

-(UILabel*)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont bxg_fontMediumWithSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0x999999];
    }
    return _titleLabel;
}

- (void)setSelected:(BOOL)selected {
    _isSelected = selected;
    if(_isSelected) {
        _titleLabel.font = [UIFont bxg_fontSemiboldWithSize:18];
        _titleLabel.textColor = [UIColor colorWithHex:0x000000];
    } else {
        _titleLabel.font = [UIFont bxg_fontMediumWithSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0x999999];
    }
}

-(void)setTitle:(NSString*)title isSelected:(BOOL)isSel  {
    self.selected = isSel;
    self.titleLabel.text = title;
}

-(NSString*)getTitle {
    return self.titleLabel.text;
}

@end
