//
//  ZWKSysAlertViewTool.h
//  WKCategoryDemo
//
//  Created by DianShi on 17/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWKSysAlertViewTool : NSObject

+ (instancetype)sharedInstance;


@property (nonatomic ,strong) void(^alertHandler)(void);
@property (nonatomic ,strong) void(^cancleHandler)(void);

/**
 *  显示alert，只有一个按钮，响应事件
 *
 *  @param title     title
 *  @param message   message
 *  @param cancelStr cancel按钮titile
 *  @param handler   响应事件
 */
- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr cancelHandler:(void (^)())handler;

/**
 *  显示alert，两个按钮，other按钮带有事件
 *
 *  @param title     title
 *  @param message   message
 *  @param cancelStr cancel标题
 *  @param otherStr  other按钮标题
 *  @param handler   other按钮事件
 */
- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr otherBtn:(NSString *)otherStr otherHandler:(void (^)())handler;

/**
 *  显示alert，两个按钮，cancel,other按钮带有事件
 *
 *  @param title     title
 *  @param message   message
 *  @param cancelStr cancel标题
 *  @param otherStr  other标题
 *  @param handler   other按钮事件
 *  @param cancleHandler cancel按钮事件
 */
- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr otherBtn:(NSString *)otherStr otherHandler:(void (^)())handler cancleHandler:(void (^)())cancleHandler;

@end
