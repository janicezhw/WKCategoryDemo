//
//  ViewController.m
//  WKCategoryDemo
//
//  Created by DianShi on 2017/2/9.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "ViewController.h"
//#import "WKBaseViewController+ShowAlert.h"
#import "ZWKSysAlertViewTool.h"
#import "ZWKBaseViewController+NavigationBarSetting.h"
#import "ZWKDatePickerView.h"
#import "NSDate+ZWKAdd.h"
#import "UIView+ZWKBorder.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"WKCategoryDemo";
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    [self setNavigationBarWithBarTintColor:[UIColor blackColor]];
    [self setNavigationBarWithTintColor:[UIColor whiteColor]];
    [self setNavigationBarWithTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ZWKSysAlertViewTool sharedInstance] showOkayAlertWithTitle:@"hah" andMessage:@"message" cancelTitle:@"hao" cancelHandler:^{
            WKDebugLog(@"fffff");
        }];
    });
    
    UILabel *dateLabel = [UILabel new];
    [self.view addSubview:dateLabel];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    
    ZWKDatePickerView *datePickerView = [[ZWKDatePickerView alloc]initWithDateStyle:ZWKDateStyleShowYearMonthDay];
    [self.view addSubview:datePickerView];
    datePickerView.ZWKDatePickerDidSelectBlock = ^(NSDate *selectedDate){
        dateLabel.text = [NSDate stringFromDate:selectedDate withFormatString:@"yyyy-MM-dd"];
    };
    
    datePickerView.minLimitDate = [NSDate dateWithString:@"2015-06-07" format:@"yyyy-MM-dd"];
    datePickerView.maxLimitDate = [NSDate dateWithString:@"2018-06-07" format:@"yyyy-MM-dd"];
    datePickerView.startDate = [NSDate dateWithString:@"2019-12-13" format:@"yyyy-MM-dd"];


    [datePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(44*3);
        make.width.mas_equalTo(SCREEN_WIDTH/1.5);
    }];
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(datePickerView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
//    [dateLabel addTopLineWidth:1 andLineColor:[UIColor redColor] andInset:UIEdgeInsetsMake(2, 10, 0, 20)];
//    [dateLabel addBottomLineWidth:1 andLineColor:[UIColor redColor] andInset:UIEdgeInsetsMake(0, 10, 2, 20)];
//    [dateLabel addLeftLineWidth:1 andLineColor:[UIColor redColor] andInset:UIEdgeInsetsMake(2, 10, 2, 0)];
//    [dateLabel addRightLineWidth:1 andLineColor:[UIColor redColor] andInset:UIEdgeInsetsMake(2, 0, 2, 20)];

    [dateLabel addBorderWithLineWidth:1 andLineColor:[UIColor redColor] andInset:UIEdgeInsetsMake(2, 10, 6, 20)];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    

}
- (IBAction)pushBtnClick:(id)sender {
    [self.navigationController pushViewController:[ZWKBaseViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
