//
//  HomeTableViewController.m
//  AutoLayout
//
//  Created by Chen on 15/11/2.
//  Copyright © 2015年 Chen. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kGetWidth(__A) (__A*kScreenWidth/375)

#define DoctOfficeCellID @"DoctOffice"

#import "HomeTableViewController.h"
#import "HomeHeaderView.h"
#import "DoctOfficeCell.h"
#import "HomeTableViewCell.h"

@interface HomeTableViewController() <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) HomeHeaderView *header;
@end

@implementation HomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加header
    [self addHeaderView];
    
    // 根据不同情况，显示不同的页面
//    [self ChangeViews];
    
    // 2.注册HomeTableViewCell
//    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil]forCellReuseIdentifier:@"HomeTableViewCell"];
}
/**
 *  根据不同情况，显示不同的页面
 */
- (void)ChangeViews
{
    NSArray *arrays =  _header.constraints;
    for (int i = 0; i < arrays.count; i++) {
        if (i == 7) {
            NSLayoutConstraint *cs = arrays[i];
            cs.constant = 0;
            [_header removeConstraint:cs];
            
            [_header addConstraint:[NSLayoutConstraint constraintWithItem:_header.firstBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_header.collectionView
                                                                attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
            //在修改一下header的frame，就行了
            _header.frame = CGRectMake(0, 0, 0, kGetWidth(330));//280
            self.tableView.tableHeaderView = _header;
        }
    }
}

- (void)addHeaderView
{
    HomeHeaderView *header = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, 375, kGetWidth(440))];//WithFrame:CGRectMake(0, 0, 375, 300)
    [self.view addSubview:header];
    self.tableView.tableHeaderView = header;
    self.header = header;
    header.translatesAutoresizingMaskIntoConstraints = NO;
    // 设置header的约束
    NSLayoutConstraint *constraint = nil;
    // 添加顶部的约束
    constraint = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view
                                              attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    [self.view addConstraint:constraint];
    // 添加左边的约束
    constraint = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
                                              attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [self.view addConstraint:constraint];
    //添加右边约束
    constraint = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view
                                              attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    [self.view addConstraint:constraint];
    //添加底部约束
    constraint = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:header.thirdBtn
                                              attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    [self.view addConstraint:constraint];

    header.collectionView.delegate = self;
    header.collectionView.dataSource = self;
    
    [header.collectionView registerClass:[DoctOfficeCell class] forCellWithReuseIdentifier:DoctOfficeCellID];
}
#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.获得cell
    DoctOfficeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DoctOfficeCellID forIndexPath:indexPath];
    
    // 2.传递模型
    NSString *imageName = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
    cell.iconView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

#pragma mark - 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%ld行",(long)indexPath.item);
}

#pragma mark - UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell = [HomeTableViewCell cellWithTableView:tableView];
    
    return cell;
}

#pragma mark - UITableView Delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"点击了第%ld行",(long)indexPath.row);
}

@end
