//
//  UIImage+Category.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)
- (UIImage *)circleImage:(CGSize )size {
    //创建一个图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    //获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //设置范围
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // 根据一个rect创建一个椭圆
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪
    CGContextClip(ctx);
    
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
