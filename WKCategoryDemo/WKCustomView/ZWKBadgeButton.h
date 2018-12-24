//
//  ZWKBadgeButton.h
//  WKCategoryDemo
//
//  Created by DianShi on 15/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KBadgeTypeNumber,
    KBadgeTypeNotice
} KBadgeType;

@interface ZWKBadgeButton : UIButton

@property (nonatomic ,assign) NSInteger badgeNumber;
@property (nonatomic,assign) KBadgeType badgeType;
@property (nonatomic,assign) BOOL badgeHidden;

@end
