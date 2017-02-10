//
//  NSString+WKAdd.m
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/9.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "NSString+WKAdd.h"

@implementation NSString (WKAdd)


- (NSString *)transformToPinYinWithUppType:(kUppType)uppType
{
    NSMutableString *pinyin = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //    NSLog(@"%@", pinyin);
    
    switch (uppType) {
        case kUppTypeLowercase:
            return [pinyin lowercaseString];
            break;
        case kUppTypeUppercase:
            return [pinyin uppercaseString];
            break;
        case kUppTypeCapitalized:
            return [pinyin capitalizedString];
            break;
        default:
            return [pinyin lowercaseString];
            break;
    }
}

- (NSString *)transformToChar:(NSString *)charStr inRange:(NSRange)range{
    NSString *starStr = @"";
    for (NSInteger i=0; i<range.length; i++) {
        starStr = [starStr stringByAppendingString:charStr];
    }
    
    NSMutableString *originStr = [self mutableCopy];
    [originStr replaceCharactersInRange:range withString:starStr];
    
    return originStr;
}

- (NSString *)transformStarcharWithRange:(NSRange)range{
    return [self transformToChar:@"*" inRange:range];
}


- (NSString *)countNumAndChangeformat
{
    int count = 0;
    long long int a = self.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:self];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}

+ (NSString *)getDecimalFormatStr:(double)income{
    NSNumber *incomeNum = [NSNumber numberWithDouble:income];
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    // 小数位最多位数
    numberFormatter.maximumFractionDigits = 2;
    // 小数位最少位数
    numberFormatter.minimumFractionDigits = 0;
    
    NSString *incomeStr = [numberFormatter stringFromNumber:incomeNum];
    return incomeStr;
}


- (BOOL)isEnglishChar{
    NSString *      regex = @"^[A-Za-z ]+$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isNumChar{
    NSString *      regex = @"^[0-9]+$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isEnglishCharOrNum{
    NSString *      regex = @"^[A-Za-z0-9]+$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isTelPhone{
    NSString *      regex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isChineseOrEnglishChar{
    NSString *      regex = @"^[\u4E00-\u9FA5A-Za-z]+$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isUrl
{
    NSString *      regex = @"^http(s)?:\\/\\/";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

@end
