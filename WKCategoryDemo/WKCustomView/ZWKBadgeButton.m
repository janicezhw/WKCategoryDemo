//
//  ZWKBadgeButton.m
//  WKCategoryDemo
//
//  Created by DianShi on 15/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKBadgeButton.h"

@interface ZWKBadgeButton ()
{
    UILabel *_badgeLabel;
    CGFloat _labelWidth;
    CGFloat _badgeHeight;
    
}
@end

@implementation ZWKBadgeButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)awakeFromNib{
    [super awakeFromNib];
    //    if (IS_IOS7) {
    //        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.center.mas_equalTo(0);
    //        }];
    //    }
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}

- (void)setBadgeType:(KBadgeType)badgeType{
    _badgeType = badgeType;
    
    
    
    _badgeLabel = [UILabel new];
    [self addSubview:_badgeLabel];
    switch (_badgeType) {
        case KBadgeTypeNumber:
        {
            _badgeHeight = 16;
            [_badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(0);
                make.centerY.mas_equalTo(self.titleLabel.mas_top).with.offset(2);
                make.height.mas_equalTo(_badgeHeight);
                make.width.mas_greaterThanOrEqualTo(_badgeHeight);
            }];
        }
            break;
        case KBadgeTypeNotice:
        {
            _badgeHeight = 8;
            [_badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.imageView.mas_right);
                make.top.mas_equalTo(self.imageView.mas_top);
                make.height.with.mas_equalTo(_badgeHeight);
            }];
        }
            break;
        default:
            break;
    }
    
    _badgeLabel.layer.cornerRadius = _badgeHeight/2.0f;
    _badgeLabel.clipsToBounds = YES;
    
    _badgeLabel.backgroundColor = [UIColor redColor];
    _badgeLabel.textAlignment = NSTextAlignmentCenter;
    _badgeLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    _badgeLabel.textColor = [UIColor whiteColor];
    self.badgeHidden = YES;
}

- (void)setBadgeNumber:(NSInteger)badgeNumber
{
    _badgeNumber = badgeNumber;
    if (_badgeType == KBadgeTypeNumber) {
        if (badgeNumber>0) {
            if (badgeNumber<=99) {
                _badgeLabel.text = [NSString stringWithFormat:@"%@",@(badgeNumber)];
            }else{
                _badgeLabel.text = @"99+";
            }
            //            [_badgeLabel sizeToFit];
            //            _labelWidth = _badgeLabel.width;
            //1.告知需要更新约束，但不会立刻开始，系统然后调用updateConstraints
            [self setNeedsUpdateConstraints];
            
            //2.告知立刻更新约束，系统立即调用updateConstraints
            [self updateConstraintsIfNeeded];
            
            [self layoutIfNeeded];
            
            self.badgeHidden = NO;
        }else{
            _badgeLabel.text = @"";
            self.badgeHidden = YES;
        }
    }else{
        self.badgeHidden = (badgeNumber>0)? NO:YES;
    }
    
}


- (void)setBadgeHidden:(BOOL)badgeHidden{
    _badgeHidden = badgeHidden;
    _badgeLabel.hidden = badgeHidden;
}

- (void)updateConstraints{
    
    [_badgeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        //        make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(5);
        //        make.centerY.mas_equalTo(self.titleLabel.mas_top);
        //        make.height.mas_equalTo(_badgeHeight);
        //        make.width.mas_equalTo( MAX((_labelWidth+5), _badgeHeight) );
        make.width.mas_equalTo(MAX(_badgeLabel.intrinsicContentSize.width+5,_badgeHeight));
    }];
    
    [super updateConstraints];
}

@end
