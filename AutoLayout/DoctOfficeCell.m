//
//  DoctOfficeCell.m
//  PerfectDoc
//
//  Created by Chen on 15/6/16.
//  Copyright (c) 2015年 YX. All rights reserved.
//

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

#import "DoctOfficeCell.h"

@implementation DoctOfficeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.iconView = [[UIImageView alloc]init];
        _iconView.userInteractionEnabled = YES;
        [self addSubview:_iconView];
        
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置collectionView左边和右边的约束
    NSMutableArray *constrainArray = [NSMutableArray array];
    //设置左边和右边的约束
    [constrainArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_iconView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_iconView,self)]];
    
    //设置顶部和底部的约束
    [constrainArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_iconView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_iconView,self)]];
    
     [self addConstraints:constrainArray];
}

@end
