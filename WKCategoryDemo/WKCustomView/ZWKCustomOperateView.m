//
//  ZWKCustomOperateView.m
//  WKCategoryDemo
//
//  Created by DianShi on 13/06/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKCustomOperateView.h"
#import "ZWKCustomOperateCollectionViewCell.h"

@interface ZWKCustomOperateView ()<UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    //    UIView *_bgView;
    
    UIEdgeInsets _edgeInsets;
    CGFloat _itemWidth;
    CGFloat _itemHeight;
    NSInteger _lineCount;
    CGFloat _collectionViewHeight;
    
    NSArray <ZWKCustomOperateCellModel *> *_itemArray;
}
@end

@implementation ZWKCustomOperateView

- (instancetype)initWithWidth:(CGFloat)width edges:(UIEdgeInsets)edgeInsets itemCountPerLine:(NSInteger)countPerLine items:(NSArray *)items heightRatio:(CGFloat)ratio{
    self = [super init];
    if (self) {
       

        _itemArray = items;
        _itemWidth = (width-edgeInsets.left-edgeInsets.right)/countPerLine;
        _itemHeight = _itemWidth*ratio;
        _lineCount = (NSInteger)_itemArray.count/countPerLine + (NSInteger)((_itemArray.count%countPerLine)?1:0);
        
        
        
        _edgeInsets = edgeInsets;
        
        _collectionViewHeight = _edgeInsets.top+_edgeInsets.bottom+_itemHeight*_lineCount;
         self.frame = CGRectMake(0, 0, width, _collectionViewHeight);
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    // 整体用collectionview布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setMinimumLineSpacing:0];
    [layout setMinimumInteritemSpacing:0];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *operateCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), _collectionViewHeight) collectionViewLayout:layout];
    operateCollectionView.userInteractionEnabled = YES;
    [self addSubview:operateCollectionView];
    operateCollectionView.delegate = self;
    operateCollectionView.dataSource = self;
    
    operateCollectionView.backgroundColor = [UIColor whiteColor];
    [operateCollectionView registerClass:[ZWKCustomOperateCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _itemArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZWKCustomOperateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellModel = _itemArray[indexPath.row];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    ZWKCustomOperateCellModel *itemModel = _itemArray[indexPath.row];
    
    if (itemModel.handler) {
        itemModel.handler();
        
    }
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (CGSize){_itemWidth,_itemHeight};
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return _edgeInsets;
    
}

@end
