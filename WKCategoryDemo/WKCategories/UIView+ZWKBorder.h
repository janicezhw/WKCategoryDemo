//
//  UIView+ZWKBorder.h
//  WKCategoryDemo
//
//  Created by DianShi on 13/09/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZWKBorder)

- (void)addTopLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset;
- (void)addBottomLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset;
- (void)addLeftLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset;
- (void)addRightLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset;
- (void)addBorderWithLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset;

@end
