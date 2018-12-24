//
//  DSOperateCollectionViewCell.m
//  ZJS_Shop
//
//  Created by 点石科技 on 16/9/6.
//  Copyright © 2016年 点石科技. All rights reserved.
//

#import "ZWKCustomOperateCollectionViewCell.h"

@interface ZWKCustomOperateCollectionViewCell ()
{
    CGFloat _multipliedFloat;
    CGFloat _imageSpanFloat;
    
    
    UIView *_contentView;
    UILabel *_titleLabel;
    UIImageView *_imageView;
}
@end

@implementation ZWKCustomOperateCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //        _multipliedFloat = 0.7;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _contentView  = [UIView new];
    [self.contentView addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.left.mas_equalTo(0);
        //        make.height.mas_equalTo(self.mas_height).with.multipliedBy(_multipliedFloat);
    }];
    self.contentView.userInteractionEnabled = NO;
    _contentView.userInteractionEnabled = NO;
    
    _titleLabel = [UILabel new];
    [_contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(24);
    }];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textColor = [UIColor colorWithHexString:DSGrayColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _imageView = [UIImageView new];
    [_contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        //        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(_titleLabel.mas_top);
        make.centerX.mas_equalTo(0);
    }];
    //    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)setTitleLabelFont:(UIFont *)font{
    _titleLabel.font = font;
}

- (void)setCustomContentHeightMultiplied:(CGFloat)multiplied andImageSpan:(CGFloat)imageSpanFloat {
    _multipliedFloat = multiplied;
    _imageSpanFloat = imageSpanFloat;
    
    [self setNeedsUpdateConstraints];
    
    //2.告知立刻更新约束，系统立即调用updateConstraints
    [self updateConstraintsIfNeeded];
    
    [self layoutIfNeeded];
}

- (void)updateConstraints{
    
    //    [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        make.height.mas_equalTo(self.mas_height).with.multipliedBy(self.multipliedFloat);
    //    }];
    if (_multipliedFloat) {
        [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(self.mas_height).with.multipliedBy(_multipliedFloat);
        }];
        
        [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(_titleLabel.mas_top).with.offset(-_imageSpanFloat);
            make.centerX.mas_equalTo(0);
        }];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }else{
        [_imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            //        make.top.mas_equalTo(0);
            //        make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(_titleLabel.mas_top).with.offset(-_imageSpanFloat);
            //        make.centerX.mas_equalTo(0);
        }];
    }
    
    
    
    
    [super updateConstraints];
}

- (void)setCellModel:(ZWKCustomOperateCellModel *)cellModel{
    _cellModel = cellModel;
    _titleLabel.text = cellModel.title;
    _imageView.image = [UIImage imageNamed:cellModel.imageStr];
}

@end



@implementation ZWKCustomOperateCellModel

- (instancetype)initWithTitle:(NSString *)titleStr imageStr:(NSString *)imageStr handler:(DSOperateItemHandler)handler
{
    self = [super init];
    if (self) {
        self.title = titleStr;
        self.imageStr= imageStr;
        self.handler = handler;
    }
    return self;
}

@end
