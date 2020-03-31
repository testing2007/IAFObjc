//
//  IAFMaskView.m
//  Art
//
//  Created by ZhiQiang wei on 2020/3/31.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFMaskView.h"
@interface IAFMaskView : UIView
- (instancetype)initWithType:(IAFMaskViewType)type;
- (instancetype)initWithButtonType:(IAFButtonMaskViewType)type buttonBlock:(void (^)(void))buttonBlock;
- (instancetype)initWithLoadingType:(IAFLoadingMaskViewType)type;
@property (nonatomic, copy) void(^buttonBlock)(void) ;
@end

@implementation IAFMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self) {
        
        self.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    }
    return self;
}

- (instancetype)initWithButtonType:(IAFButtonMaskViewType)type buttonBlock:(void(^)(void))buttonBlock {
    self = [self initWithFrame:CGRectZero];
    _buttonBlock = buttonBlock;
    switch (type) {
        case IAFButtonMaskViewTypeNoLogin:{
            [self installMaskView:@"空白页-暂无数据" andMessage:@"开启学习之旅!" andButtonText:@"点击登录"];
        }break;
        default:
            break;
    }
    return self;
}

- (instancetype)initWithLoadingType:(IAFLoadingMaskViewType)type; {
    self = [self initWithFrame:CGRectZero];
    if(self) {
        switch (type) {
            case IAFLoadingMaskViewTypeNormal:
            {
                [self installLoadingMaskView];
                self.backgroundColor = [UIColor whiteColor];
            }break;
            default:
                break;
        }
    }
    return self;
}

- (instancetype)initWithType:(IAFMaskViewType)type{
    
    self = [self initWithFrame:CGRectZero];
    if(self) {
        
        switch (type) {
            case IAFMaskViewTypeNoNetwork:
            {
                [self installMaskView:@"空白页-暂无网络" andMessage:@"网络异常"];
            }break;
            case IAFMaskViewTypeLoadFailed:
            {
                [self installMaskView:@"空白页-加载失败" andMessage:@"加载失败!"];
            }break;
            case IAFMaskViewTypeNoData:{
                [self installMaskView:@"空白页-暂无数据" andMessage:@"暂无数据哟!"];
            }break;
            case IAFMaskViewTypeNoLogin:
            {
                [self installMaskView:@"空白页-暂无数据" andMessage:@"点击登录"];
            }break;
            default:
                break;
        }
    }
    return self;
}
#pragma mark - Setting

- (void)installMaskView:(NSString *)imageString andMessage:(NSString *)message {
    [self installMaskView:imageString andMessage:message andButtonText:nil];
}

- (void)installMaskView:(NSString *)imageString andMessage:(NSString *)message andButtonText:(NSString*)buttonText {
    
    self.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.font = [UIFont bxg_fontRegularWithSize:15];
    label.textColor = [UIColor colorWithHex:0x333333];
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
//        make.centerY.offset(15);
        make.centerY.offset(30);
    }];
    
    UIImageView *imageView = [UIImageView new];
    [imageView setImage:[UIImage imageNamed:imageString]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(label.mas_top).offset(0);
        make.centerX.offset(0);
    }];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    label.text = message;
    
    if(buttonText) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithHex:0x38ADFF];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:buttonText forState:UIControlStateNormal];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_bottom).offset(15);
            make.centerX.offset(0);
            make.width.equalTo(@165);
            make.height.equalTo(@30);
        }];
    }
}

- (void)btnAction {
    if(_buttonBlock) {
        _buttonBlock();
    }
}

- (void)installLoadingMaskView; {
    
    UIActivityIndicatorView *aiview = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self addSubview:aiview];
    self.backgroundColor = [UIColor whiteColor];
    [aiview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [aiview startAnimating];
}

@end

@implementation UIView (MaskView)

// Loding Mask View

- (void)installLoadingMaskView {
    [self installLoadingMaskViewWithInset:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)installLoadingMaskViewWithInset:(UIEdgeInsets)inset; {
    
    UIView *maskView = [[IAFMaskView alloc]initWithLoadingType:IAFLoadingMaskViewTypeNormal];
    [self layoutMaskView:maskView andInset:inset];
}

// Normol Mask View

- (void)installMaskView:(IAFMaskViewType)type{
    [self installMaskView:type andInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
}
- (void)installMaskView:(IAFMaskViewType)type andInset:(UIEdgeInsets)inset{

    UIView *maskView = [[IAFMaskView alloc]initWithType:type];
    [self layoutMaskView:maskView andInset:inset];
}

// Button Mask View

- (void)installMaskView:(IAFButtonMaskViewType)type buttonBlock:(void (^)(void))buttonBlock {
    [self installMaskView:type andInset:UIEdgeInsetsMake(0, 0, 0, 0) buttonBlock:buttonBlock];
}

- (void)installMaskView:(IAFButtonMaskViewType)type andInset:(UIEdgeInsets)inset buttonBlock:(void (^)(void))buttonBlock {
    
    UIView *maskView = [[IAFMaskView alloc]initWithButtonType:type buttonBlock:buttonBlock];
    [self layoutMaskView:maskView andInset:inset];
}

// Remove Mask View

- (void)removeMaskView; {
    
    NSArray *subviews = self.subviews;
    for(NSInteger i = 0; i < subviews.count; i++) {
        
        UIView *subview = subviews[i];
        if([subview isKindOfClass:[IAFMaskView class]]){
            
            [subview removeFromSuperview];
        }
    }
}

// Layout Mask View

- (void)layoutMaskView:(UIView *)maskView andInset:(UIEdgeInsets)inset {
    [self removeMaskView];
    [self addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(+inset.top);
        make.left.offset(+inset.left);
        make.bottom.offset(-inset.bottom);
        make.right.offset(-inset.right);
        make.width.equalTo(self).offset(-inset.left -inset.right);
        make.height.equalTo(self).offset(-inset.top -inset.bottom);
    }];
}
@end
