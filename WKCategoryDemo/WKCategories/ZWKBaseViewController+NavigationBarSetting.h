//
//  ZWKBaseViewController+NavigationBarSetting.h
//  WKCategoryDemo
//
//  Created by DianShi on 17/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKBaseViewController.h"

@interface ZWKBaseViewController (NavigationBarSetting)

//背景图片 barMetrics需要设置成UIBarMetricsDefault
-(void)setNavigationBarWithBackgroundImage:(UIImage *)backgroundImage;

//背景阴影图片
-(void)setNavigationBarWithShadowImage:(UIImage *)shadowImage;

//背景颜色
-(void)setNavigationBarWithBarTintColor:(UIColor *)barTintColor;

//标题文字属性
-(void)setNavigationBarWithTitleTextAttributes:(NSDictionary *)titleTextAttributes;

//系统类型按钮文字颜色
-(void)setNavigationBarWithTintColor:(UIColor *)tintColor;

//返回按钮图片  必须要两个都设置，并且图片要设置成不渲染
-(void)setNavigationBarWithBackIndicatorImage:(UIImage *)backIndicatorImage;

//标题垂直偏移
-(void)setNavigationBarWithTitleVerticalPositionAdjustment:(CGFloat)adjustment;

@end
