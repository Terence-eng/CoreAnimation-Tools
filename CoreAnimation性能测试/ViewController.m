//
//  ViewController.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/14.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@property (nonatomic, strong) NSMutableArray *titleArr;

@property (nonatomic, strong) NSMutableArray *classArr;
@end

@implementation ViewController
- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
    }
    return _titleArr;
}

- (NSMutableArray *)classArr {
    if (!_classArr) {
        _classArr = [NSMutableArray array];
    }
    return _classArr;
}
- (void)viewDidLoad {
    self.title = @"Core Animation性能测试";
    
    [self addCell:@"Color Blended Layers" class:@"BlendedLayerViewController"];
    [self addCell:@"Color Hits GreenandMissesRed" class:@"ColorHitsGreenandMissesRedController"];
    [self addCell:@"Color Copied Image" class:@"ColorCopiedImageViewController"];
    [self addCell:@"Color Misaligned Image" class:@"ColorMisalignedImageController"];
    [self addCell:@"Color Offscreen-Rendered Yellow" class:@"ColorOffscreen_RenderedYellowController"];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titleArr addObject:title];
    [self.classArr addObject:className];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WX"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WX"];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classArr[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = self.titleArr[indexPath.row];
        ctrl.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
