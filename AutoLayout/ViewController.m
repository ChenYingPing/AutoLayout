//
//  ViewController.m
//  AutoLayout
//
//  Created by Chen on 15/10/29.
//  Copyright © 2015年 Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewHeight;

@property (nonatomic, assign) CGFloat constant;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.constant = 80;
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.firstViewHeight.constant = self.constant;
    
//    [self.firstView setNeedsUpdateConstraints];
    
//    [self.firstView layoutIfNeeded];
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"tableView";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
