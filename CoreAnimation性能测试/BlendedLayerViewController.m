//
//  BlendedLayerViewController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/5/25.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "BlendedLayerViewController.h"
/*
 Color Blended Layers
 一般设置背景颜色透明就会出现这种情况，因为需要GPU去计算重叠部分的像素
 这个选项基于渲染程度对屏幕中的混合区域进行绿到红的高亮（也就是多个半透明图层的叠加）。
 由于重绘的原因，混合对GPU性能会有影响，同时也是滑动或者动画帧率下降的罪魁祸首之一。
 */
@interface BlendedLayerViewController ()

@end

@implementation BlendedLayerViewController

- (void)viewDidLoad {
    UIView *ViewA = [[UIView alloc ] initWithFrame:CGRectMake(0,100,200,200)];
    ViewA.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
    [self.view addSubview:ViewA];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 100, 20)];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor =[UIColor blackColor];
    label.text = @"BlendedLayer";
    [self.view addSubview:label];
    
    
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
