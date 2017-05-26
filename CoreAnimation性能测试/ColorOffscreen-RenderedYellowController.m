//
//  ColorOffscreen-RenderedYellowController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "ColorOffscreen-RenderedYellowController.h"
#import "UIView+Category.h"
#import "TableViewCell.h"
@interface ColorOffscreen_RenderedYellowController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) UISwitch *swich;
@end
/*
 Color Offscreen-Rendered Yellow
 这里会把那些需要离屏渲染的图层高亮成黄色。这些图层很可能需要用shadowPath或者shouldRasterize来优化。
 */
@implementation ColorOffscreen_RenderedYellowController
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
//        _tableView.rowHeight = 80;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.swich];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //dequeue cell
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    return cell;
}
#pragma mark -- swichAction
- (void)swichAction {
    self.swich.on = self.swich.isOn;
    [self.tableView reloadData];
}
@end
