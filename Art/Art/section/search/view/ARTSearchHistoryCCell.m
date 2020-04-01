//
//  ARTSearchCCell.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTSearchHistoryCCell.h"
#import "IAFFloatView.h"

@interface ARTSearchHistoryCCell ()

@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIButton  *delBtn;
@property (nonatomic, strong) IAFFloatView  *floatView;

@end

@implementation ARTSearchHistoryCCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self installUI];
    }
    return self;
}

- (void)installUI {
    self.backgroundColor = [UIColor randomColor];

    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.delBtn];
    [self.contentView addSubview:self.floatView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
    }];
    [self.delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(0);
    }];
    [self.floatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.bottom.offset(0);
    }];
    [self layoutIfNeeded]; //这个很重要
}


- (UILabel*)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"历史搜索";
        _titleLabel.font = [UIFont bxg_fontMediumWithSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0x000000];
    }
    return _titleLabel;
}

- (UIButton *)delBtn {
    if(_delBtn == nil) {
        _delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delBtn setTitle:@"删除" forState:UIControlStateNormal];
        _delBtn.titleLabel.font = [UIFont bxg_fontRegularWithSize:14];
        [_delBtn addTarget:self action:@selector(onRemoveAllHistory:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delBtn;
}

- (void)onRemoveAllHistory:(UIButton*)sender {
    if(self.removeAllHistoryBlock) {
        self.removeAllHistoryBlock();
    }
}

- (IAFFloatView *)floatView {
    if(_floatView == nil) {
        _floatView = [IAFFloatView new];
        _floatView.backgroundColor = [UIColor randomColor];
        _floatView.padding = UIEdgeInsetsMake(5, 5, 5, 5);
        _floatView.itemMaxWidth = 80;
        _floatView.maxShowLines = 2;
        
        Weak(weakSelf);
        _floatView.switchOpenBlock = ^(BOOL isOpen) {
            NSLog(@"%@", weakSelf.floatView);
            [weakSelf setSize:CGSizeMake(weakSelf.bounds.size.width, weakSelf.floatView.bottom)];
        };
    }
    return _floatView;
}

- (void)setHistoryKeywords:(NSArray*)keywords {
    
    [self.floatView removeFloatData];
        
    for(int i=0; i<keywords.count; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.text = keywords[i];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont bxg_fontMediumWithSize:15];
        label.textColor = [UIColor colorWithHex:0x999999];
        label.backgroundColor = [UIColor randomColor];
        label.layer.borderColor = [UIColor colorWithHex:0x880000].CGColor;
        label.layer.masksToBounds = true;
        label.layer.cornerRadius = 5;
        label.userInteractionEnabled = true;
        [self.floatView addSubview:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapLabel:)];
        [label addGestureRecognizer:tap];
    }

    [self.floatView sizeToFit];
    [self setSize:CGSizeMake(self.bounds.size.width, self.floatView.bottom)];
}

-(void)onTapLabel:(NSObject*)ges {
    NSLog(@"onTapLabel");
}



@end
