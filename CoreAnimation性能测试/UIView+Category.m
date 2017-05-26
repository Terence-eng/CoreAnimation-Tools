//
//  UIView+Category.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
+ (UIView *)drawRadius:(CGFloat)radius BackgroundColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [color setFill];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.frame = rect;
    shapelayer.path = bezier.CGPath;
    [view.layer addSublayer:shapelayer];
    return view;
}
@end
