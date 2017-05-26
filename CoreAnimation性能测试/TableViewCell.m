//
//  TableViewCell.m
//  CoreAnimation性能测试
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+Category.h"

@interface TableViewCell ()


@end

@implementation TableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(10, 15, 50, 50);
        imageView.image = [UIImage imageNamed:@"bb"];
        imageView.layer.masksToBounds = true;
        imageView.layer.cornerRadius = 25;
        [self.contentView addSubview:imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(70, 15, 50, 50);
        [button setImage:[UIImage imageNamed:@"bb"] forState:UIControlStateNormal];
        button.layer.cornerRadius = 25;
        button.layer.masksToBounds = YES;
        [self.contentView addSubview:button];

        
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(125,15, 80, 40)];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 10;
        [self.contentView addSubview:view];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.contentView.bounds.size.width - 80 - 10, 15, 80, 40)];
        label.backgroundColor = [UIColor redColor];
        label.text = @"测试";
        
        label.layer.cornerRadius = 8;
        label.layer.masksToBounds = YES;
        [self.contentView addSubview:label];
        
        
    }
    return self;
}
@end
