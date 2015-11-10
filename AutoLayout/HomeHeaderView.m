//
//  HomeHeaderView.m
//  AutoLayout
//
//  Created by Chen on 15/11/2.
//  Copyright © 2015年 Chen. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kGetWidth(__A) (__A*kScreenWidth/375)
#import "HomeHeaderView.h"

@interface HomeHeaderView() 

@end

@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置第一个collectionView
        [self setUpFirstCollectionView];
        
        // 设置collectionView下方的图片，可能有1张，3张，5张等不同情况
        [self setUpPageViews];
        
        self.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
}

- (void)setUpFirstCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kGetWidth(60), kGetWidth(60));
    layout.minimumInteritemSpacing = kGetWidth(30);  //水平间距
    layout.minimumLineSpacing =  layout.minimumInteritemSpacing;      //垂直间距
    layout.sectionInset = UIEdgeInsetsMake(0, layout.minimumInteritemSpacing / 2, 0, layout.minimumInteritemSpacing / 2);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:_collectionView];
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置collectionView左边和右边的约束
    NSMutableArray *constrainArray = [NSMutableArray array];
    //设置左边和右边的约束
    [constrainArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_collectionView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_collectionView,self)]];
    
    //设置顶部和底部的约束
//    [constrainArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_collectionView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_collectionView,self)]];
    
    [self addConstraints:constrainArray];
    
    NSLayoutConstraint *constraint = nil;
    
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:_collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self
                                                                   attribute:NSLayoutAttributeTop multiplier:1.0f constant:15];
    [self addConstraint:constraint];
    
    //添加collectionView的高度等于屏幕宽度的一半 -30
    constraint = [NSLayoutConstraint constraintWithItem:_collectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeWidth multiplier:0.5f constant:-30];
    [self addConstraint:constraint];
}

- (void)setUpPageViews
{
    // 1.添加第一个btn
    UIButton *firstBtn = [[UIButton alloc]init];
    firstBtn.backgroundColor = [UIColor redColor];
    [firstBtn addTarget:self action:@selector(firstBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstBtn];
    self.firstBtn = firstBtn;
    firstBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *constrainArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[firstBtn]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstBtn,self)];
    [self addConstraints:constrainArray];
    
    NSLayoutConstraint *constraint = nil;
    
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:firstBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_collectionView
                                              attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10];
    [self addConstraint:constraint];
    
    // 添加高度约束
    constraint = [NSLayoutConstraint constraintWithItem:firstBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeHeight multiplier:0.3f constant:0];
    [self addConstraint:constraint];
    
    // 2.添加第二个btn
    UIButton *secondBtn = [[UIButton alloc]init];
    secondBtn.backgroundColor = [UIColor blueColor];
    [secondBtn addTarget:self action:@selector(secondBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:secondBtn];
    secondBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:secondBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:firstBtn
                                              attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10];
    [self addConstraint:constraint];
    
    // 添加左边的约束
    constraint = [NSLayoutConstraint constraintWithItem:secondBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    //添加高度约束
    constraint = [NSLayoutConstraint constraintWithItem:secondBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeWidth multiplier:0.15f constant:0];
    [self addConstraint:constraint];
    
    //添加宽度约束
    constraint = [NSLayoutConstraint constraintWithItem:secondBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0];
    [self addConstraint:constraint];
    
    // 3.添加第三个btn
    UIButton *thirdBtn = [[UIButton alloc]init];
    thirdBtn.backgroundColor = [UIColor orangeColor];
    [thirdBtn addTarget:self action:@selector(thirdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:thirdBtn];
    self.thirdBtn = thirdBtn;
    thirdBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:thirdBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:secondBtn
                                              attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    // 添加左边的约束
    constraint = [NSLayoutConstraint constraintWithItem:thirdBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:secondBtn
                                              attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    //添加高度约束
    constraint = [NSLayoutConstraint constraintWithItem:thirdBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:secondBtn
                                              attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    //添加宽度约束
    constraint = [NSLayoutConstraint constraintWithItem:thirdBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:secondBtn
                                              attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    // 4.添加第四个btn
    UIButton *fourthBtn = [[UIButton alloc]init];
    fourthBtn.backgroundColor = [UIColor grayColor];
    [fourthBtn addTarget:self action:@selector(thirdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fourthBtn];
    fourthBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:fourthBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:thirdBtn
                                              attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10];
    [self addConstraint:constraint];
    
    // 添加左边的约束
    constraint = [NSLayoutConstraint constraintWithItem:fourthBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    //添加右边约束
    constraint = [NSLayoutConstraint constraintWithItem:fourthBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    [self addConstraint:constraint];
    
    //添加高度约束
    constraint = [NSLayoutConstraint constraintWithItem:fourthBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self
                                              attribute:NSLayoutAttributeWidth multiplier:0.18f constant:0];
    [self addConstraint:constraint];

}
#pragma mark - btnClick
- (void)firstBtnClick
{
    NSLog(@"点击了firstBtnClick");
}

- (void)secondBtnClick
{
    NSLog(@"点击了secondBtnClick");
}

- (void)thirdBtnClick
{
    NSLog(@"点击了thirdBtnClick");
}
@end













