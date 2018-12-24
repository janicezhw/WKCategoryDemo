//
//  ZWKCustomOperateView.h
//  WKCategoryDemo
//
//  Created by DianShi on 13/06/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWKCustomOperateView : UIView

- (instancetype)initWithWidth:(CGFloat)width edges:(UIEdgeInsets)edgeInsets itemCountPerLine:(NSInteger)countPerLine items:(NSArray *)items heightRatio:(CGFloat)ratio;

@end
