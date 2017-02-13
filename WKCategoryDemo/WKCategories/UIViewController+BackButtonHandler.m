//
//  UIViewController+BackButtonHandler.m
//  LLRailTrip
//
//  Created by WK on 16/3/22.
//  Copyright © 2016年 Amethy. All rights reserved.
//

#import "UIViewController+BackButtonHandler.h"

@implementation UIViewController (BackButtonHandler)

@end

@implementation UINavigationController (ShouldPopOnBackButton)

//UINavigationBar的代理方法之一  的完整签名
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    
    if([self.viewControllers count] < [navigationBar.items count]){
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        /*__系统返回按钮会随着返回动画而边淡__**littleSun_zheng**/
        
//        for(UIView *subview in [navigationBar subviews]) {
//            if(subview.alpha < 1.) {
//                [UIView animateWithDuration:.25 animations:^{
//                    subview.alpha = 1.;
//                }];
//            }
//        }
    }
    return NO;
}


@end



