//
//  ColorCopiedImageViewController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "ColorCopiedImageViewController.h"
/*
 这个选项主要检查我们有无使用不正确图片格式,由于手机显示都是基于像素的，所以当手机要显示一张图片的时候，系统会帮我们对图片进行转化。比如一个像素占用一个字节，故而RGBA则占用了4个字节，则1920 x 1080的图片占用了7.9M左右，但是平时jpg或者png的图片并没有那么大，因为它们对图片做了压缩，但是是可逆的。所以此时，如果图片的格式不正确，则系统将图片转化为像素的时间就有可能变长。而该选项就是检测图片的格式是否是系统所支持的，若是GPU不支持的色彩格式的图片则会标记为蓝色,则只能由CPU来进行处理。CPU被强制生成了一些图片，然后发送到渲染服务器，而不是简单的指向原始图片的的指针。我们不希望在滚动视图的时候,CPU实时来进行处理,因为有可能会阻塞主线程。
 */
@interface ColorCopiedImageViewController ()

@end

@implementation ColorCopiedImageViewController

- (void)viewDidLoad {
//    UIImage *image = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WechatIMG1" ofType:@"png"]];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 100, 100)];
//    imageView.image = image;
//    [self.view addSubview:imageView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
