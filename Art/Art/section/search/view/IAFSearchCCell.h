//
//  IAFSearchCCell.h
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^IAFRemoveHistoryBlockType)(void);


@interface IAFSearchCCell : UICollectionViewCell

- (void)setTexts:(NSArray*)arrText;

@property (nonatomic, copy) IAFRemoveHistoryBlockType removeHistoryBlock;

@end

NS_ASSUME_NONNULL_END
