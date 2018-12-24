//
//  ZWKDefine.h
//  WKPublicClassDemo
//
//  Created by DianShi on 2017/2/13.
//  Copyright © 2017年 WK. All rights reserved.
//

#ifndef ZWKDefine_h
#define ZWKDefine_h


#ifdef DEBUG
#define WKDebugLog(...) NSLog(__VA_ARGS__)
#define WKDebugMethod() NSLog(@"[method] = >%s", __func__)
#else
#define WKDebugLog(...)
#define WKDebugMethod()
#endif

#define WEAK_SELF               __weak __typeof(self) weakself = self;


//服务器地址


//系统版本
#define IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]
#define STATUSBAR_HEIGHT    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?20.0:0.0)

//APP版本
#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD_VERSION   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

// 设备型号
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_IOS7 (IOS_VERSION >= 7.0 && IOS_VERSION < 8.0)

//屏幕大小
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_ORIGIN_X ([[UIScreen mainScreen] bounds].origin.x)
#define SCREEN_ORIGIN_Y ([[UIScreen mainScreen] bounds].origin.y)
//
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//全局常量
#define APPDELEGATE         (AppDelegate *)[[UIApplication sharedApplication] delegate]

// 有时候需要等比缩放字体或者图片
#define AutoSizeScaleX      SCREEN_WIDTH / 320
#define AutoSizeScaleY      (SCREEN_HEIGHT >480 ? SCREEN_HEIGHT / 568:1)


//文件系统目录
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


//字体大小
#define FontSize [UIFont systemFontOfSize:14*AutoSizeScaleX]


//输入框校验
#define myDotNumbers     @"0123456789.\n"
#define myNumbers        @"0123456789\n"


#endif /* ZWKDefine_h */
