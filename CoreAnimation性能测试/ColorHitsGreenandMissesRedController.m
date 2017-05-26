//
//  ColorHitsGreenandMissesRedController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "ColorHitsGreenandMissesRedController.h"

@interface ColorHitsGreenandMissesRedController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISwitch *swich;
@end

/*
 ColorHitsGreenandMissesRed - 当使用shouldRasterizep属性的时候，
 耗时的图层绘制会被缓存，然后当做一个简单的扁平图片呈现。
 当缓存再生的时候这个选项就用红色对光栅化图层进行了高亮。
 如果缓存频繁再生的话，就意味着光栅化可能会有负面的性能影响了（更多关于使用shouldRasterize的细节见第15章“图层性能”）。
 
 很多视图Layer由于Shadow、Mask和Gradient等原因渲染很高，因此UIKit提供了API用于缓存这些Layer,self.layer.shouldRasterize = true系统会将这些Layer缓存成Bitmap位图供渲染使用，如果失效时便丢弃这些Bitmap重新生成。图层Rasterization光栅化好处是对刷新率影响较小，坏处是光栅化处理后的Bitmap缓存需要占用内存，而且当图层需要缩放时，要对光栅化后的Bitmap做额外计算。 使用这个选项后时，如果Rasterized的Layer失效，便会标注为红色，如果有效标注为绿色。当测试的应用频繁闪现出红色标注图层时，表明对图层做的Rasterization作用不大。
 在测试的过程中,第一次加载时,开启光栅化的layer会显示为红色,这是很正常的,因为还没有缓存成功。但是如果在接下来的测试,。例如我们来回滚动TableView时,我们仍然发现有许多红色区域,那就需要谨慎对待了
 
 CALayer 的 border、圆角、阴影、遮罩（mask），CASharpLayer 的矢量图形显示，通常会触发离屏渲染（offscreen rendering），而离屏渲染通常发生在 GPU 中。当一个列表视图中出现大量圆角的 CALayer，并且快速滑动时，可以观察到 GPU 资源已经占满，而 CPU 资源消耗很少。这时界面仍然能正常滑动，但平均帧数会降到很低。为了避免这种情况，可以尝试开启 CALayer.shouldRasterize 属性，但这会把原本离屏渲染的操作转嫁到 CPU 上去。对于只需要圆角的某些场合，也可以用一张已经绘制好的圆角图片覆盖到原本视图上面来模拟相同的视觉效果。最彻底的解决办法，就是把需要显示的图形在后台线程绘制为图片，避免使用圆角、阴影、遮罩等属性。
 
 
 */
@implementation ColorHitsGreenandMissesRedController
- (UISwitch *)swich {
    if (!_swich) {
        _swich = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        _swich.on = NO;
        [_swich addTarget:self action:@selector(swichAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _swich;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.swich];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //dequeue cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.textLabel.text = @"sssssssssssssdfsdfdfsdfdsfsfsffsdfdfsdssfsdfdsfsdfsfsf";
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        cell.textLabel.layer.shadowOffset = CGSizeMake(3, 3);
        cell.textLabel.layer.shadowOpacity = 0.5;
        cell.textLabel.layer.shadowRadius = 3;
        cell.textLabel.backgroundColor = [UIColor whiteColor];
    }
    
    if (self.swich.isOn == YES) {
        //光栅化。美工的术语，将cell中的所有的内容，生成一张独立的图像。
        //在屏幕滚动的时候，只显示图像，如微信发动态图的时候，动态表情是动不了的，就是使用了栅格化
        cell.layer.shouldRasterize = true;
        
        //光栅化，必须制定分辨率，不然图像会模糊
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        //异步绘制。苹果解释：如果cell比较复杂，可以使用
//        cell.layer.drawsAsynchronously = YES;
    }
    else {
//        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.layer.shouldRasterize = false;
    }
    
   
    return cell;
}
#pragma mark -- swichAction
- (void)swichAction {
    self.swich.on = self.swich.isOn;
    [self.tableView reloadData];
}

@end
