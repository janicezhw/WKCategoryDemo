//
//  ZWKBaseViewController+NavigationBarSetting.m
//  WKCategoryDemo
//
//  Created by DianShi on 17/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKBaseViewController+NavigationBarSetting.h"

@implementation ZWKBaseViewController (NavigationBarSetting)

- (UINavigationBar *)navigationBar{
    return self.navigationController.navigationBar;
}

//背景图片 barMetrics需要设置成UIBarMetricsDefault
-(void)setNavigationBarWithBackgroundImage:(UIImage *)backgroundImage{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //背景图片 barMetrics需要设置成UIBarMetricsDefault
    [navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}

//背景阴影图片
-(void)setNavigationBarWithShadowImage:(UIImage *)shadowImage{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //背景阴影图片
    [navigationBar setShadowImage:shadowImage];
}

//背景颜色
-(void)setNavigationBarWithBarTintColor:(UIColor *)barTintColor{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //背景颜色
    [navigationBar setBarTintColor:barTintColor];
}

//标题文字属性
-(void)setNavigationBarWithTitleTextAttributes:(NSDictionary *)titleTextAttributes{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //标题文字属性
    [navigationBar setTitleTextAttributes:titleTextAttributes];
}

//系统类型按钮文字颜色
-(void)setNavigationBarWithTintColor:(UIColor *)tintColor{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //系统类型按钮文字颜色
    [navigationBar setTintColor:tintColor];
}

//返回按钮图片  必须要两个都设置，并且图片要设置成不渲染
-(void)setNavigationBarWithBackIndicatorImage:(UIImage *)backIndicatorImage{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    
    //返回按钮图片  必须要两个都设置，并且图片要设置成不渲染
    [navigationBar setBackIndicatorImage:backIndicatorImage];
    [navigationBar setBackIndicatorTransitionMaskImage:backIndicatorImage];
}

//标题垂直偏移
-(void)setNavigationBarWithTitleVerticalPositionAdjustment:(CGFloat)adjustment{
    // 获取特定类的所有导航条
    UINavigationBar *navigationBar = [self navigationBar];
    //标题垂直偏移
    [navigationBar setTitleVerticalPositionAdjustment:adjustment forBarMetrics:UIBarMetricsDefault];

}

@end
