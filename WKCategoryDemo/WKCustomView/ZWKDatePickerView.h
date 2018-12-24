//
//  ZWKDatePickerView.h
//  WKCategoryDemo
//
//  Created by DianShi on 12/06/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWKDatePickerView : UIView

typedef enum{
    ZWKDateStyleShowYearMonthDayHourMinute  = 0,
    ZWKDateStyleShowYearMonth,
    ZWKDateStyleShowYearMonthDay,
    ZWKDateStyleShowMonthDayHourMinute,
    ZWKDateStyleShowMonthDay,
    ZWKDateStyleShowHourMinute
}ZWKDateStyle;

@property (nonatomic,strong) NSDate *startDate; // 当前时间

@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认9999）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认0）

- (instancetype)initWithDateStyle:(ZWKDateStyle)datePickerStyle;

@property (nonatomic,copy) void (^ZWKDatePickerDidSelectBlock)(NSDate *selectedDate);

@end
