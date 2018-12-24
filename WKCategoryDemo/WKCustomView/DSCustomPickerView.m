//
//  DSCustomPickerView.m
//  SMSW
//
//  Created by 点石科技 on 16/6/13.
//  Copyright © 2016年 点石科技. All rights reserved.
//

#import "DSCustomPickerView.h"

@interface DSCustomPickerView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    UIView *_pickerBackView;
    CGFloat _pickerBackHeight;
    
}
@property (nonatomic,strong) NSArray *totalListArray;
@property (nonatomic,strong) NSMutableArray *tableViewArray;
@end

@implementation DSCustomPickerView

@synthesize selectedIndexArray = _selectedIndexArray;


static CGFloat cellHeight = 44;

- (instancetype)initWithListArray:(NSArray *)totalListArray andWidthArray:(NSArray *)widthArray andHeight:(CGFloat)listHeight supView:(UIView *)supView topY:(CGFloat)topY{
    self = [super init];
    if (self) {
        self.totalListArray = totalListArray;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        self.frame = CGRectMake(0, topY, SCREEN_WIDTH, SCREEN_HEIGHT-topY);
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        tapGesture.delegate = self;
        [self addGestureRecognizer:tapGesture];
       
        
        NSInteger maxCount = 0;
        for (NSArray *listArray in totalListArray) {
            maxCount = MAX(maxCount,listArray.count);
        }
        _pickerBackHeight = (listHeight)? listHeight:cellHeight*(MIN(MAX(maxCount, 4), 9)); // 最小4 最大9 在这期间用count
        _pickerBackHeight = MIN(_pickerBackHeight, SCREEN_HEIGHT*((IS_IPHONE_4_OR_LESS)?0.5:0.6));
        

        _pickerBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 0)];
        _pickerBackView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_pickerBackView];
        _pickerBackView.clipsToBounds = YES;
        
        NSMutableArray *tableviewWdiths = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i<widthArray.count; i++) {
            [tableviewWdiths addObject:@(SCREEN_WIDTH*[widthArray[i] floatValue])];
        }
        
        CGFloat orginX = 0;
        for (NSInteger i = 0; i< totalListArray.count; i++) {
            CGFloat tableviewWidth = (tableviewWdiths.count>i)? [tableviewWdiths[i] floatValue]:SCREEN_WIDTH/totalListArray.count;
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(orginX, 0,  tableviewWidth,  _pickerBackHeight)];
            orginX += tableView.width;
            tableView.tag = i;
            [_pickerBackView addSubview:tableView];
            
            tableView.delegate = self;
            tableView.dataSource = self;
//            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            [tableView setTableFooterView:[UIView new]];
            
            [self.tableViewArray addObject:tableView];
            
            if (i>=0 && i<totalListArray.count-1) {
                UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(orginX-1, 0, 1, _pickerBackHeight)];
                lineView.backgroundColor = [UIColor colorWithHexString:DSSeparatorLineColor];
                [_pickerBackView addSubview:lineView];
            }
        }
        
        
        [self showInView:supView];
        [self showPickerView];
    }
    return self;
}

- (void)setSelectedIndexArray:(NSMutableArray *)selectedIndexArray{
    _selectedIndexArray = selectedIndexArray;
    for (UITableView *tableview in _tableViewArray) {
        [tableview reloadData];
        NSInteger selectIndex = (selectedIndexArray.count> tableview.tag)? [selectedIndexArray[tableview.tag] integerValue]:-1;
        if (selectIndex>=0) {
            [tableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:[selectedIndexArray[tableview.tag] integerValue] inSection:0] animated:YES scrollPosition:UITableViewScrollPositionBottom];
        }
    }
}

- (NSMutableArray *)selectedIndexArray{
    if (!_selectedIndexArray) {
        _selectedIndexArray = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i<_totalListArray.count; i++) {
            [_selectedIndexArray addObject:@(-1)];
        }
    }
    return _selectedIndexArray;
}

- (void)showInView:(UIView *)view
{
    [view addSubview:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *listArray  = (NSArray *)_totalListArray[tableView.tag];
    return listArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor colorWithHexString:DSBlackColor];
    }
    NSArray *listArray  = (NSArray *)_totalListArray[tableView.tag];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",listArray[indexPath.row]];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (NSInteger i=0 ; i<self.selectedIndexArray.count; i++) {
        if (tableView.tag == i) {
            [self.selectedIndexArray replaceObjectAtIndex:i withObject:@(indexPath.row)];
        }
        
        if (tableView.tag == 0 && i!=0) {
            [self.selectedIndexArray replaceObjectAtIndex:i withObject:@(-1)];
        }
    }
    
    DSDebugLog(@"%@",self.selectedIndexArray);
    self.selectedIndexArray = _selectedIndexArray;
    
    if (![_selectedIndexArray containsObject:@(-1)]) {
        //完成选择
        DSDebugLog(@"完成");
        if ([self.delegate respondsToSelector:@selector(pickerComplete:)]) {
            [self.delegate pickerComplete:self.selectedIndexArray];
        }
//
        [self tappedCancel];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
//    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"] || [NSStringFromClass([touch.view class]) isEqualToString:@"UITableView"]) {
        return NO;
    }
    return  YES;
}

- (void)tappedCancel {
	
    [self hiddenPickerView:^(BOOL finished) {
        
    }];
    if ([_delegate respondsToSelector:@selector(customPickerTappedCancel)]) {
        [_delegate customPickerTappedCancel];
    }
}

- (void)showPickerView
{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        CGRect rect = _pickerBackView.frame;
        rect.size.height = _pickerBackHeight;
        _pickerBackView.frame = rect;
//        _pickerView.frame = CGRectMake(0, self.frame.size.height-216-44, _pickerView.frame.size.width, _pickerView.frame.size.height);
    }completion:^(BOOL finished) {
    }];
}

- (void)hiddenPickerView:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];

        CGRect rect = _pickerBackView.frame;
        rect.size.height = 0;
        _pickerBackView.frame = rect;
    }completion:^(BOOL finished) {
        if (finished) {
            self.hidden = YES;
//ios 8上的bug 直接移除会崩溃， 延迟0.5秒执行移除 解决问题。
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
                completion(YES);
            });
        }
    }];
}

- (NSMutableArray *)tableViewArray{
    if (!_tableViewArray) {
        _tableViewArray = [[NSMutableArray alloc]init];
    }
    return _tableViewArray;
}

@end
