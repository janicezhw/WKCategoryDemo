//
//  NSDate+WKAdd.m
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/13.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "NSDate+WKAdd.h"

@implementation NSDate (WKAdd)

+ (NSString *)stringFromDate:(NSDate *)date withFormatString:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    return [formatter stringFromDate:date];
}

+ (NSString *)longTimeStringFromDateString:(NSString *)dateString withFormatString:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    NSDate *date = [formatter dateFromString:dateString];
  
    return [self longTimeStringFromDate:date];
}

+ (NSString *)longTimeStringFromDate:(NSDate *)date{
    NSTimeInterval longTime = [date timeIntervalSince1970]*1000;
    return [NSString stringWithFormat:@"%@",@(longTime)];
}


+ (NSString *)dateStringFromLongTime:(NSTimeInterval )longTime withFormatString:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:longTime/1000];
    return [formatter stringFromDate:date];
}

+ (NSString *)transformDateString:(NSString *)dateString withFormatString:(NSString *)formatString toDataStringFormatString:(NSString *)toFormatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    NSDateFormatter *toFormatter = [[NSDateFormatter alloc] init];
    [toFormatter setDateFormat:toFormatString];
    
    NSDate *date = [formatter dateFromString:dateString];
    return [toFormatter stringFromDate:date];
}


@end
