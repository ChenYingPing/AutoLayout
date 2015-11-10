//
//  HomeTableViewCell.m
//  AutoLayout
//
//  Created by Chen on 15/11/4.
//  Copyright © 2015年 Chen. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell()
@end

@implementation HomeTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
//        self.docIocn.layer.cornerRadius = 31;
//        self.docIocn.layer.masksToBounds = YES;
    }
    return self;
}

@end
