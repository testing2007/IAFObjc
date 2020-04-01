//
//  IAFSearchView.h
//  Art
//
//  Created by ZhiQiang wei on 2020/4/1.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "IAFSearchRecommendView.h"
//#import "IAFSearchRecommendView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol IAFSearchViewDelegate <NSObject>

@optional
- (void)searchViewTextDidBeginEditing;
- (void)searchViewTextDidEndEditingKeywork:(NSString*)keyword;

- (void)searchViewSearchButtonClicked:(NSString*)keyword;
- (void)searchViewCancelButtonClicked;

//- (void)searchViewClickedKeyword:(NSString*)keyword;

@end

@interface IAFSearchView : UIView

@property (nonatomic, weak) id<IAFSearchViewDelegate>  delegate;

- (void)releaseFocus;

@end

NS_ASSUME_NONNULL_END
