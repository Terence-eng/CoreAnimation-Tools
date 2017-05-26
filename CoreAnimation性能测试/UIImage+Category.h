//
//  UIImage+Category.h
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

- (UIImage *)circleImage:(CGSize )size;

+ (UIImage *)drawRadius:(CGFloat)radius backgroundColor:(UIColor *)color size:(CGSize)size;
@end
