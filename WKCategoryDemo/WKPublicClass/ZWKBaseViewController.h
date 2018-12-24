//
//  ZWKBaseViewController.h
//  WKPublicClassDemo
//
//  Created by DianShi on 15/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWKBaseViewController : UIViewController

@property (nonatomic,assign) BOOL viewControllerNavgationBarHidden;

@property (nonatomic ,strong) void(^leftNavItemHandler)(void);
@property (nonatomic ,strong) void(^rightNavItemHandler)(void);


@property (nonatomic ,strong) void(^alertHandler)(void);
@property (nonatomic ,strong) void(^cancleHandler)(void);


- (void)initLeftNavItemWithTitle:(NSString *)title andImage:(UIImage *)image andLeftItmeHandel:(void (^)())leftHandel;

- (void)initRightNavItemWithTitle:(NSString *)title andImage:(UIImage *)image andRightItmeHandel:(void (^)())rightHandel;

- (void)initRightNavBadgeItemWithTitle:(NSString *)title andImage:(UIImage *)image andRightItmeHandel:(void (^)())rightHandel;

@end
