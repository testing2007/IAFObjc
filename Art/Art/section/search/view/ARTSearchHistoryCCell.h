//
//  ARTSearchHistoryCCell.h
//  Art
//
//  Created by ZhiQiang wei on 2020/3/30.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^IAFRemoveAllHistoryBlockType)(void);


@interface ARTSearchHistoryCCell : UICollectionViewCell

- (void)setHistoryKeywords:(NSArray*)keywords;

@property (nonatomic, copy) IAFRemoveAllHistoryBlockType removeAllHistoryBlock;


@end

NS_ASSUME_NONNULL_END
