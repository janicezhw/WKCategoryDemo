//
//  NSDate+WKAdd.h
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/13.
//  Copyright © 2017年 WK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WKAdd)
/**
 *  通过date 和 format获得 相应的NSString
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormatString:(NSString *)formatString;
+ (NSString *)longTimeStringFromDateString:(NSString *)dateString withFormatString:(NSString *)formatString;
+ (NSString *)dateStringFromLongTime:(NSTimeInterval )longTime withFormatString:(NSString *)formatString;
+ (NSString *)transformDateString:(NSString *)dateString withFormatString:(NSString *)formatString toDataStringFormatString:(NSString *)toFormatString;
@end
