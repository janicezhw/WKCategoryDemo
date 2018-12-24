//
//  ZWKCustomOperateCollectionViewCell.h
//  ZJS_Shop
//
//  Created by 点石科技 on 16/9/6.
//  Copyright © 2016年 点石科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZWKCustomOperateCellModel;
@interface ZWKCustomOperateCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) ZWKCustomOperateCellModel *cellModel;

/**
 *  设置内容高度
 *
 *  @param multiplied 如果使用image默认大小，则设置为0, 否则0.5~1 之间
 *  @param imageSpan  图片和title直接的间隔。
 */
- (void)setCustomContentHeightMultiplied:(CGFloat)multiplied andImageSpan:(CGFloat)imageSpan;
- (void)setTitleLabelFont:(UIFont *)font;

@end

@interface ZWKCustomOperateCellModel : NSObject

typedef void(^DSOperateItemHandler)();


@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *imageStr;
@property (nonatomic,copy) DSOperateItemHandler handler;

- (instancetype)initWithTitle:(NSString *)titleStr imageStr:(NSString *)imageStr handler:(DSOperateItemHandler )handler;




@end
