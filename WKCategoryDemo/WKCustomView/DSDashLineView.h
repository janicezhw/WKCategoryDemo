//
//  DSDashLineView.h
//  LXQShop
//
//  Created by DianShi on 25/04/2017.
//  Copyright © 2017 com.dianshi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DSDashSideShapeTypeCircle,
    DSDashSideShapeTypeRect
} DSDashSideShapeType;

@interface DSDashLineView : UIView


/**
 *  设置虚线参数
 *
 *  @param dashColorStr 虚线颜色（6位GBG）
 *  @param dashWidth    虚线宽度
 *  @param gapWidth     虚线间隔宽度
 *  @param ovalColorStr 半圆颜色
 *  @param ovalHeight   半圆高度
 *  @param dashSideShapeType   边缘形状类型（半圆/三角）
 */
- (void)setDashColorStr:(NSString *)dashColorStr dashWidth:(CGFloat)dashWidth andGapWidth:(CGFloat)gapWidth leftAndRightOvalColor:(NSString *)ovalColorStr andOvalHeight:(CGFloat)ovalHeight dashSideShapeType:(DSDashSideShapeType)dashSideShapeType;
@end
