//
//  NSDate+ZWKAdd.m
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/13.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "NSDate+ZWKAdd.h"

@implementation NSDate (ZWKAdd)

- (NSString*)weekdayString {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    return [weekdays objectAtIndex:theComponents.weekday];
}

- (NSString *)stringWithFormatString:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    return [formatter stringFromDate:self];
}

+ (NSString *)longTimeStringFromDateString:(NSString *)dateString withFormatString:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    NSDate *date = [formatter dateFromString:dateString];
  
    return [date longTimeString];
}

- (NSString *)longTimeString{
    NSTimeInterval longTime = [self timeIntervalSince1970]*1000;
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
