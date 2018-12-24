//
//  ZWKNavigationController.m
//  WKCategoryDemo
//
//  Created by DianShi on 17/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKNavigationController.h"

@interface ZWKNavigationController ()

@end

@implementation ZWKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

+(void)initialize{
    // 获取特定类的所有导航条
//    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//    
//    //背景图片 barMetrics需要设置成UIBarMetricsDefault
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
//    
//    //背景阴影图片
//    [navigationBar setShadowImage:[UIImage imageNamed:@""]];
//    
//    //背景颜色
//    [navigationBar setBarTintColor:[UIColor whiteColor]];
//    
//    //标题文字属性
//    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
//    
//    //系统类型按钮文字颜色
//    [navigationBar setTintColor:[UIColor whiteColor]];
//    
//    //返回按钮图片  必须要两个都设置，并且图片要设置成不渲染
//    [navigationBar setBackIndicatorImage:[UIImage imageNamed:@""]];
//    [navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@""]];
//    
//    //标题垂直偏移
//    [navigationBar setTitleVerticalPositionAdjustment:10.0f forBarMetrics:UIBarMetricsDefault];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
 
    //tabbar结构，设置push进入隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
