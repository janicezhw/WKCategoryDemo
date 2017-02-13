//
//  UIViewController+BackButtonHandler.h
//  LLRailTrip
//
//  Created by WK on 16/3/22.
//  Copyright © 2016年 Amethy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>

@optional
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (BackButtonHandler)<BackButtonHandlerProtocol>

@end
