//
//  ZWKBaseViewController.m
//  WKPublicClassDemo
//
//  Created by DianShi on 15/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKBaseViewController.h"
#import "ZWKBadgeButton.h"

@interface ZWKBaseViewController ()

@end

@implementation ZWKBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    WKDebugLog(@"-----%@ willAppear-----",[self class]);
    [self.navigationController setNavigationBarHidden:_viewControllerNavgationBarHidden animated:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)dealloc{
    WKDebugLog(@"-----%@ dealloc-----",[self class]);
    //    [[DSHttpServices sharedInstance] cancelAllOperationWithTarget:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _viewControllerNavgationBarHidden = NO;

    [self.view setBackgroundColor:[UIColor colorWithHexString:DSBackgroundColor]];
    
    [self setNavigationBarStyle];
    
}

- (void)setNavigationBarStyle{
    
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:DSBlueColor]] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:DSBlueColor]];
//    self.navigationController.navigationBar.translucent = NO; // 取消模糊效果 如果不设置与下面相同颜色时会有色差。。
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
   
    if (IS_IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //    self.automaticallyAdjustsScrollViewInsets = NO;
}



- (void)initLeftNavItemWithTitle:(NSString *)title andImage:(UIImage *)image andLeftItmeHandel:(void (^)())leftHandel{
    self.leftNavItemHandler = leftHandel;
    if (!leftHandel) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        [leftButton setTitle:title forState:UIControlStateNormal];
        [leftButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
    
    if (image) {
        [leftButton setImage:image forState:UIControlStateNormal];
    }
    
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton sizeToFit];
    
    if (title.length) {
        leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }else{
        leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
    }
    
    [leftButton addTarget:self action:@selector(navLeftItmeAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
}


- (void)navLeftItmeAction:(id)sender{
    if (self.leftNavItemHandler) {
        self.leftNavItemHandler();
    }else{
        [self.view endEditing:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)initRightNavItemWithTitle:(NSString *)title andImage:(UIImage *)image andRightItmeHandel:(void (^)())rightHandel{
    self.rightNavItemHandler = rightHandel;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        [rightButton setTitle:title forState:UIControlStateNormal];
        [rightButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
    
    if (image) {
        [rightButton setImage:image forState:UIControlStateNormal];
    }
    
    [rightButton sizeToFit];//自适应
    
    [rightButton addTarget:self action:@selector(navRightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
}

- (void)initRightNavBadgeItemWithTitle:(NSString *)title andImage:(UIImage *)image andRightItmeHandel:(void (^)())rightHandel{
    self.rightNavItemHandler = rightHandel;
    ZWKBadgeButton *rightButton = [ZWKBadgeButton buttonWithType:UIButtonTypeCustom];
    
    [rightButton setBadgeType:KBadgeTypeNotice];
    
    if (title) {
        [rightButton setTitle:title forState:UIControlStateNormal];
    }
    
    if (image) {
        [rightButton setImage:image forState:UIControlStateNormal];
    }
    
    [rightButton sizeToFit];//自适应
    
    
    [rightButton addTarget:self action:@selector(navRightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
}




- (void)navRightItemAction:(id)sender{
    if (self.rightNavItemHandler) {
        self.rightNavItemHandler();
    }else{
        
    }
}



@end
