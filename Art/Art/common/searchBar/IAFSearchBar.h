//
//  IAFSearchBar.h
//  Art
//
//  Created by ZhiQiang wei on 2017/12/27.
//  Copyright © 2017年 ZhiQiang wei All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAFSearchBar : UISearchBar

@property (nonatomic, assign, setter = setHasCentredPlaceholder:) BOOL hasCentredPlaceholder;
- (void)setSearchPlaceHolder:(NSString *)placeHolder;

@end
