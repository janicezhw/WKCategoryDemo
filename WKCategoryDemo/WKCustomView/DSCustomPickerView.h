//
//  DSCustomPickerView.h
//  SMSW
//
//  Created by 点石科技 on 16/6/13.
//  Copyright © 2016年 点石科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DSCustomPickerViewDelegate <NSObject>

@optional
- (void)pickerComplete:(NSArray *)selectedArray;
- (void)customPickerTappedCancel;
@end

@interface DSCustomPickerView : UIView

@property (nonatomic,strong) NSMutableArray *selectedIndexArray;

- (instancetype)initWithListArray:(NSArray *)totalListArray andWidthArray:(NSArray *)widthArray andHeight:(CGFloat)listHeight supView:(UIView *)supView topY:(CGFloat)topY;

@property (nonatomic, weak) id <DSCustomPickerViewDelegate> delegate;
//- (void)hiddenPickerView;
- (void)hiddenPickerView:(void (^)(BOOL finished))completion;

@end
