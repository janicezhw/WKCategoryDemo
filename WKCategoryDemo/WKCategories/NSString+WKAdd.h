//
//  NSString+WKAdd.h
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/9.
//  Copyright © 2017年 WK. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    kUppTypeUppercase, //所有大写
    kUppTypeLowercase, //所有小写
    kUppTypeCapitalized //首字母大写
} kUppType;

@interface NSString (WKAdd)

/**
 *  中文转化为拼音 是否大写字符
 */
- (NSString *)transformToPinYinWithUppType:(kUppType)uppType;

/**
 *  把字符串中的range的字符转换为某个字符
 */
- (NSString *)transformToChar:(NSString *)charStr inRange:(NSRange)range;
/**
 *  把字符串中的range的字符转换为*
 */
- (NSString *)transformStarcharWithRange:(NSRange)range;

/**
 *  整形的字符串转换为每个3位以逗号隔开
 */
- (NSString *)countNumAndChangeformat;

/**
 *  格式化输出字符串：2位小数位，整数位每三位以逗号隔开
 */
+ (NSString *)getDecimalFormatStr:(double)income;

/**
 *  正则判断是否为英文字符串
 */
- (BOOL)isEnglishChar;

/**
 *  判断是否为电话号码
 */
- (BOOL)isTelPhone;

/**
 *  判断是否为字母或数字 ，用于密码格式判断
 */
- (BOOL)isEnglishCharOrNum;

/**
 *  判断是否为数字
 */
- (BOOL)isNumChar;

/**
 *  判断是否为中文或者英文字母
 */
- (BOOL)isChineseOrEnglishChar;

/**
 *  判断是否为网址
 */
- (BOOL)isUrl;

@end
