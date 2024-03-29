//
//  IAFTabHeaderCCell.h
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IAFTabHeaderCCell : UICollectionViewCell

-(void)setTitle:(NSString*)title isSelected:(BOOL)isSelected;

@property (nonatomic, strong, readonly) UILabel  *titleLabel;

@end

NS_ASSUME_NONNULL_END
