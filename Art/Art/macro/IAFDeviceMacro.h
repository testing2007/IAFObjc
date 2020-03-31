//
//  IAFDeviceMacro.h
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#ifndef IAFDeviceMacro_h
#define IAFDeviceMacro_h

//[UIDevice userInterfaceIdiom]
#define K_IS_IPAD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) || ([[UIDevice currentDevice].model isEqualToString:@"iPad"])
#define K_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define K_IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define K_SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define K_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define K_RELATIVE_SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define K_RELATIVE_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define K_ABSOLUTE_SCREEN_WIDTH MIN(K_RELATIVE_SCREEN_WIDTH, K_RELATIVE_SCREEN_HEIGHT)
#define K_ABSOLUTE_SCREEN_HEIGHT MAX(K_RELATIVE_SCREEN_WIDTH, K_RELATIVE_SCREEN_HEIGHT)

#define K_IS_IPHONE_4_OR_LESS (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT < 568.0)
#define K_IS_IPHONE_5 (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT == 568.0)
#define K_IS_IPHONE_6 (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT == 667.0)
#define K_IS_IPHONE_6_PLUS (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT == 736.0)
#define K_IS_IPHONE_X (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT == 812.0)
#define K_IS_IPHONE_XR (K_IS_IPHONE && K_ABSOLUTE_SCREEN_HEIGHT == 896.0)

#define K_NAVIGATION_BAR_OFFSET (K_IS_IPHONE_X || K_IS_IPHONE_XR ? 88 : 64) // 导航栏 偏移量
#define K_STATUS_BAR_OFFSET (K_IS_IPHONE_X || K_IS_IPHONE_XR ? 44 : 20) // 状态栏 偏移量
#define K_BOTTOM_SAFE_OFFSET (K_IS_IPHONE_X || K_IS_IPHONE_XR ? 34 : 0)
#define K_BOTTOM_TAB_BAR_HEIGHT 48

#endif /* IAFDeviceMacro_h */
