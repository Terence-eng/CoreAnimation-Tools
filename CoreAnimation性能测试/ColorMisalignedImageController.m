//
//  ColorMisalignedImageController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "ColorMisalignedImageController.h"

@interface ColorMisalignedImageController ()

@end
/*
 ColorMisalignedImage
 这里会高亮那些被缩放或者拉伸以及没有正确对齐到像素边界的图片，即图片Size和imageView中的Size不匹配，会使图过程片缩放，而缩放会占用CPU，所以在写代码的时候保证图片的大小匹配好imageView,那些图片不正常显示的会高亮成黄色，正常显示的没有颜色
 */
@implementation ColorMisalignedImageController

- (void)viewDidLoad {
    //bb.png@2x.png 是一个300 * 300的图片，所以我们UIImageView应该设置130 * 150；
    
    UIImageView *imageView1 = [[UIImageView alloc]init];
    imageView1.frame = CGRectMake(0, 80, 100, 100);
    imageView1.image = [UIImage imageNamed:@"bb"];
    [self.view addSubview:imageView1];
    
    
    UIImageView *imageView2 = [[UIImageView alloc]init];
    imageView2.frame = CGRectMake(110, 80, 150, 150);
    imageView2.image = [UIImage imageNamed:@"bb"];
    [self.view addSubview:imageView2];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
