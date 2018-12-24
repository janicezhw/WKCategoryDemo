//
//  DSDashLineView.m
//  LXQShop
//
//  Created by DianShi on 25/04/2017.
//  Copyright © 2017 com.dianshi. All rights reserved.
//

#import "DSDashLineView.h"

@interface DSDashLineView ()
{
    NSString *_dashColorStr;
//    CGFloat _dashLineWidth;
    CGFloat _dashWidth;
    CGFloat _dashGapWidth;
    NSString *_ovalColorStr;
    CGFloat _ovalHeight;
    DSDashSideShapeType _dashSideShapeType;
}
@end

@implementation DSDashLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _dashColorStr = @"F49826";
        _dashWidth = 4;
        _dashGapWidth = 3;
        _ovalColorStr = @"F49826";
        _ovalHeight = 8;
        _dashSideShapeType = DSDashSideShapeTypeCircle;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _dashColorStr = @"F49826";
    _dashWidth = 4;
    _dashGapWidth = 3;
    _ovalColorStr = @"F49826";
    _ovalHeight = 8;
    _dashSideShapeType = DSDashSideShapeTypeCircle;
}

- (void)setDashColorStr:(NSString *)dashColorStr dashWidth:(CGFloat)dashWidth andGapWidth:(CGFloat)gapWidth leftAndRightOvalColor:(NSString *)ovalColorStr andOvalHeight:(CGFloat)ovalHeight dashSideShapeType:(DSDashSideShapeType)dashSideShapeType{
    
    if (dashColorStr) {
        _dashColorStr = dashColorStr;
    }
    
    if (dashWidth > 0 ) {
        _dashWidth = dashWidth;
    }
    if (gapWidth > 0) {
        _dashGapWidth = gapWidth;
    }
    if (ovalColorStr) {
        _ovalColorStr = ovalColorStr;
    }
    if (ovalHeight > 0) {
        _ovalHeight = ovalHeight;
    }
    
    _dashSideShapeType = dashSideShapeType;
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    //绘制虚线
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 0.5f;
    [path moveToPoint:CGPointMake(0, self.height/2)];
    [path addLineToPoint:CGPointMake(self.width, self.height/2)];
    CGFloat dash[] = {_dashWidth,_dashGapWidth};
    [path setLineDash:dash count:2 phase:0];
    [[UIColor colorWithHexString:_dashColorStr] setStroke];
    [path stroke];
    
    switch (_dashSideShapeType) {
        case DSDashSideShapeTypeCircle:
        {
            //绘制左边圆形
            UIBezierPath *rectangleCorner = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-_ovalHeight/2, self.height/2-_ovalHeight/2, _ovalHeight, _ovalHeight)];
            [[UIColor colorWithHexString:_ovalColorStr] setFill];
            [rectangleCorner fill];
            
            //绘制右边圆形
            UIBezierPath *rightRectangleCorner = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.width-_ovalHeight/2, self.height/2-_ovalHeight/2, _ovalHeight, _ovalHeight)];
            [[UIColor colorWithHexString:_ovalColorStr] setFill];
            [rightRectangleCorner fill];
        }
            break;
        case DSDashSideShapeTypeRect:
        {
            //绘制左边三角
            {
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path moveToPoint:CGPointMake(_ovalHeight/2, self.height/2)];
                [path addLineToPoint:CGPointMake(0, self.height/2-_ovalHeight/2)];
                [path addLineToPoint:CGPointMake(0, self.height/2+_ovalHeight/2)];
                [path closePath];
                
                // 设置线宽
                path.lineWidth = 0.5;
                
                // 设置填充颜色
                UIColor *fillColor = [UIColor colorWithHexString:_ovalColorStr];
                [fillColor set];
                [path fill];
                
                // 设置画笔颜色
                UIColor *strokeColor = [UIColor clearColor];
                [strokeColor set];
                
                // 根据我们设置的各个点连线
                [path stroke];
            }
           
            
            //绘制右边三角
            {
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path moveToPoint:CGPointMake(self.width-_ovalHeight/2, self.height/2)];
                [path addLineToPoint:CGPointMake(self.width, self.height/2-_ovalHeight/2)];
                [path addLineToPoint:CGPointMake(self.width, self.height/2+_ovalHeight/2)];
                [path closePath];
                
                // 设置线宽
                path.lineWidth = 0.5;
                
                // 设置填充颜色
                UIColor *fillColor = [UIColor colorWithHexString:_ovalColorStr];
                [fillColor set];
                [path fill];
                
                // 设置画笔颜色
                UIColor *strokeColor = [UIColor clearColor];
                [strokeColor set];
                
                // 根据我们设置的各个点连线
                [path stroke];
            }
            
        }
        default:
            break;
    }
    
    
    

}


@end
