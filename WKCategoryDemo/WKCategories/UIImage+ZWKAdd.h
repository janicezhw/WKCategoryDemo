//
//  UIImage+WKAdd.h
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/9.
//  Copyright © 2017年 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LayerSection) {
    LayerSectionTop,
    LayerSectionBottom,
    LayerSectionLeft,
    LayerSectionRight
};


@interface UIImage (WKAdd)

/**
 *  UIView 内容生成image
 */
+ (UIImage*)convertViewToImage:(UIView*)v;

/**
 *  获取固定size的image
 */
- (UIImage*)imageWithScaledToSize:(CGSize)newSize;

/**
 *  将图片转换为点阵图数据
 *
 *  @return 转化后的点阵图数据
 */
- (NSData *)bitmapData;

/**
 *  将图片绘制到绘图上下文中，并返回上下文
 *
 *  @return
 */
//+ (CGContextRef)bitmapRGBA8ContextFromImage:(CGImageRef)image;
- (CGContextRef)bitmapRGBA8Context;

/**
 *  缩放图片，会按照给定的最大宽度，等比缩放
 *
 *  @param maxWidth 缩放后的最大宽度
 *
 *  @return 返回缩放后的图片
 */
- (UIImage *)imageWithscaleMaxWidth:(CGFloat)maxWidth;

/**
 *  对半裁切图片
 *
 *  @param section 裁切图片的位置（上半，下半，左半，右半）
 *
 *  @return 返回裁切后的图片
 */
- (UIImage *)imageForSection:(LayerSection)section;


/**
 *  将图片转换为黑白图片
 *
 *  @return 黑白图片
 */
- (UIImage *)blackAndWhiteImage;

/**
 *  创建条形码
 *
 *  @param info 字符串信息
 *
 *  @return 条形码图片
 */
+ (UIImage *)barCodeImageWithInfo:(NSString *)info;

/**
 *  创建二维码
 *
 *  @param info  二维码内的信息
 *  @param image 二维码中心的logo图片
 *  @param width 二维码的宽度
 *
 *  @return 二维码图片
 */
+ (UIImage *)qrCodeImageWithInfo:(NSString *)info centerImage:(UIImage *)image  width:(CGFloat)width;

/**
 *  将CIImage 放大显示，并转换为UIImage。
 *
 *  @param image 原始CIImage
 *  @param size  最终尺寸的宽度
 *
 *  @return UIImage
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;

/**
 *  将原图转变为背景色透明，图片为设置的颜色
 *
 *  @param image 要改变的图片
 *  @param red   red
 *  @param green green
 *  @param blue  blue
 *
 *  @return 返回修改后的图片
 */
+ (UIImage*)imageBgColorToTransparentWith:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


/**
 加image转为NSData 限制最大大小

 @param maxDataLength 限制最大大小
 @return image转为的NSData
 */
- (NSData *)compressionImageQualityWithmaxDataLength:(NSInteger)maxDataLength;

@end
