//
//  IAFSearchCCell.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFSearchCCell.h"
#import "IAFFloatView.h"

@interface IAFSearchCCell ()

@property (nonatomic, strong) IAFFloatView  *floatView;

@end

@implementation IAFSearchCCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self installUI];
    }
    return self;
}

- (void)installUI {
    [self.contentView addSubview:self.floatView];
}

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"==============tapAction");

}

- (IAFFloatView *)floatView {
    if(_floatView == nil) {
        _floatView = [IAFFloatView new];
        _floatView.backgroundColor = [UIColor randomColor];
        _floatView.padding = UIEdgeInsetsMake(5, 5, 5, 5);
        _floatView.itemMaxWidth = 80;
        _floatView.maxShowLines = 2;
        [_floatView setFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 20)];
    }
    return _floatView;
}

- (void)setTexts:(NSArray*)arrText {
    
//    for (UIView *subview in self.floatView.subviews) {
//        [subview removeFromSuperview];
//    }
    
    for(int i=0; i<arrText.count; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.text = arrText[i];
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
    //必须将这个 floatView新的值， 设置给 UICollectionViewCell, 否则他的contentSize是一个很小的值。
    [self setSize:self.floatView.size];
}



@end
