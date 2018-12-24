//
//  UIView+ZWKBorder.m
//  WKCategoryDemo
//
//  Created by DianShi on 13/09/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "UIView+ZWKBorder.h"

@implementation UIView (ZWKBorder)

- (void)addTopLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset{
    [self layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = lineColor.CGColor;
    border.frame = CGRectMake(edgeInset.left, edgeInset.top, self.frame.size.width-edgeInset.left-edgeInset.right, lineWidht);
    [self.layer addSublayer:border];
}

- (void)addBottomLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset{
    [self layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = lineColor.CGColor;
    border.frame = CGRectMake(edgeInset.left, self.frame.size.height-edgeInset.bottom-lineWidht, self.frame.size.width-edgeInset.left-edgeInset.right, lineWidht);
    [self.layer addSublayer:border];
}
- (void)addLeftLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset{
    [self layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = lineColor.CGColor;
    border.frame = CGRectMake(edgeInset.left, edgeInset.top, lineWidht, self.frame.size.height-edgeInset.top-edgeInset.bottom);
    [self.layer addSublayer:border];
}
- (void)addRightLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset{
    [self layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = lineColor.CGColor;
    border.frame = CGRectMake(self.frame.size.width - edgeInset.right - lineWidht, edgeInset.top, lineWidht, self.frame.size.height-edgeInset.top-edgeInset.bottom);
    [self.layer addSublayer:border];
}

- (void)addBorderWithLineWidth:(CGFloat)lineWidht andLineColor:(UIColor *)lineColor andInset:(UIEdgeInsets)edgeInset{
    [self layoutIfNeeded];
    
    CALayer *border = [CALayer layer];
    border.borderColor = lineColor.CGColor;
    border.borderWidth = lineWidht;
    border.frame = CGRectMake(edgeInset.left, edgeInset.top, self.frame.size.width-edgeInset.left-edgeInset.right, self.frame.size.height-edgeInset.top-edgeInset.bottom);
    [self.layer addSublayer:border];
    
}


@end
