//
//  DYCPackageView.m
//  DYCPackage
//
//  Created by DYC on 15/10/12.
//  Copyright © 2015年 DYC. All rights reserved.
//

#import "DYCPackageView.h"
#import "DYCHeaderFooterView.h"
@interface DYCPackageView()<UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSIndexPath *selectedIndexPath;
@property (assign,nonatomic) NSInteger selectedRowCount;
@property (assign,nonatomic) BOOL isExpand;
@end

@implementation DYCPackageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews:frame];
        _isExpand = NO;
    }
    return self;
}

-(void)createSubviews:(CGRect)frame
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    _tableView = tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    if (_isExpand && _selectedIndexPath.section == section) {
        count = _selectedRowCount + 1;
    }
    else
    {
        count = 1;
    }
    NSLog(@"section is %ld,%ld",section,count);
    return count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell ;
    if (_isExpand &&_selectedIndexPath.section == indexPath.section && indexPath.row)
    {
        if (indexPath.row == _selectedRowCount) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"footer"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"footer"];
                cell.backgroundColor = [UIColor whiteColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.layer.borderWidth = 3;
                cell.layer.borderColor = [UIColor blackColor].CGColor;
                
                UILabel *packagePrice = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.contentView.frame.size.width / 3, 12)];
                [packagePrice setText:@"套餐价格"];
                [packagePrice setFont:[UIFont systemFontOfSize:12]];
                packagePrice.adjustsFontSizeToFitWidth = YES;
                packagePrice.numberOfLines = 1;
                packagePrice.tag = 1001;
                [cell.contentView addSubview:packagePrice];
                
                UILabel *originalPrice = [[UILabel alloc] initWithFrame:CGRectMake(10 + cell.contentView.frame.size.width / 3 , 10, cell.contentView.frame.size.width / 3 , 12)];
                [originalPrice setText:@"原价"];
                [originalPrice setFont:[UIFont systemFontOfSize:12]];
                originalPrice.adjustsFontSizeToFitWidth = YES;
                originalPrice.numberOfLines = 1;
                originalPrice.tag = 1002;
                [cell.contentView addSubview:originalPrice];
                
                UILabel *savePrice = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, cell.contentView.frame.size.width / 3, 12)];
                [savePrice setText:@"立省"];
                [savePrice setFont:[UIFont systemFontOfSize:12]];
                savePrice.adjustsFontSizeToFitWidth = YES;
                savePrice.numberOfLines = 1;
                savePrice.tag = 1003;
                [cell.contentView addSubview:savePrice];
                
                UIButton *buyNow = [UIButton buttonWithType:UIButtonTypeCustom];
                buyNow.frame = CGRectMake(cell.contentView.frame.size.width / 3 * 2 + 30, 13, cell.contentView.frame.size.width / 3 , 26);
                buyNow.tag = 1005;
                [buyNow setTitle:@"立即购买" forState:UIControlStateNormal];
                [buyNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                buyNow.titleLabel.adjustsFontSizeToFitWidth = YES;
                buyNow.backgroundColor = [UIColor redColor];
                [cell.contentView addSubview:buyNow];
            }
        }
        else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"child"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"child"];
                cell.backgroundColor = [UIColor yellowColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.layer.borderWidth = 3;
                
                cell.layer.borderColor = [UIColor blackColor].CGColor;
                UIImageView *productImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 60, 60)];
                productImageView.backgroundColor = [UIColor blackColor];
                productImageView.tag = 1001;
                [cell.contentView addSubview:productImageView];
                
                UILabel *productName = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, cell.contentView.frame.size.width - 110, 24)];
                [productName setFont:[UIFont systemFontOfSize:12]];
                [productName setText:@"产品名称"];
                productName.adjustsFontSizeToFitWidth = YES;
                productName.numberOfLines = 0;
                productName.tag = 1002;
                [cell.contentView addSubview:productName];
                
                UILabel *productStyle = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, cell.contentView.frame.size.width - 110, 12)];
                [productStyle setFont:[UIFont systemFontOfSize:12]];
                [productStyle setText:@"尺寸颜色"];
                productStyle.adjustsFontSizeToFitWidth = YES;
                productStyle.numberOfLines = 1;
                productStyle.tag = 1003;
                [cell.contentView addSubview:productStyle];
                
                UILabel *productPrice = [[UILabel alloc] initWithFrame:CGRectMake(80, 55, cell.contentView.frame.size.width - 110, 12)];
                [productPrice setFont:[UIFont systemFontOfSize:12]];
                [productPrice setText:@"$231223.00"];
                productPrice.adjustsFontSizeToFitWidth = YES;
                productPrice.numberOfLines = 1;
                productPrice.tag = 1004;
                [cell.contentView addSubview:productPrice];
            }
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"parent"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"parent"];
            cell.backgroundColor = [UIColor blueColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.layer.borderWidth = 3;
            cell.layer.borderColor = [UIColor blackColor].CGColor;
            
            UILabel *packageName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.contentView.frame.size.width / 3, 16)];
            [packageName setText:@"套餐搭配"];
            [packageName setFont:[UIFont systemFontOfSize:14]];
            packageName.tag = 1001;
            packageName.adjustsFontSizeToFitWidth = YES;
            [cell.contentView addSubview:packageName];
            
            UILabel *packagePrice = [[UILabel alloc] initWithFrame:CGRectMake(10 + cell.contentView.frame.size.width / 3, 12, cell.contentView.frame.size.width / 3, 12)];
            [packagePrice setText:@"套餐价格"];
            [packagePrice setFont:[UIFont systemFontOfSize:12]];
            packagePrice.adjustsFontSizeToFitWidth = YES;
            packagePrice.tag = 1002;
            [cell.contentView addSubview:packagePrice];
            
            CGFloat width = (self.frame.size.width - 90) / 5;
            for (int i = 0; i < 5; i ++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((15 + width) * i +15, 50, width, width)];
                imageView.tag = 2100 + i*100;
                imageView.backgroundColor = [UIColor blackColor];
                [cell.contentView addSubview:imageView];
            }
        }
        for (UIView *view in cell.contentView.subviews) {
            if ((view.tag -2000)/100 > 0 && [view isKindOfClass:[UIImageView class]]) {
                view.hidden = NO;
            }
        }
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isExpand && _selectedIndexPath.section == indexPath.section ) {
        NSLog(@"indexpath.row is %ld",indexPath.row);
        if (indexPath.row != 0) {
            if(indexPath.row == _selectedRowCount)
            {
                return 52.0;
            }
            return 90;
        }
        return 36;
    } else {
        return 125;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_selectedIndexPath) {
        _isExpand = YES;
        _selectedIndexPath = indexPath;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        for (UIView *view in cell.contentView.subviews) {
            if ((view.tag -2000)/100 > 0 && [view isKindOfClass:[UIImageView class]]) {
                view.alpha = 0;
            }
            if (view.tag == 1002) {
                view.alpha = 0;
            }
        }
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:[self indexPathsForExpandSection:indexPath.section] withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
    else
    {
        if (_isExpand) {
            if (_selectedIndexPath == indexPath) {
                _isExpand = NO;
                _selectedIndexPath = nil;
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                for (UIView *view in cell.contentView.subviews) {
                    if ((view.tag -2000)/100 > 0 && [view isKindOfClass:[UIImageView class]]) {
                        [UIView animateWithDuration:0.7 animations:^{
                            view.alpha = 1;
                        }];
                    }
                    if (view.tag == 1002) {
                        [UIView animateWithDuration:0.7 animations:^{
                            view.alpha = 1;
                        }];
                    }
                }
                [self.tableView beginUpdates];
                [self.tableView deleteRowsAtIndexPaths:[self indexPathsForExpandSection:indexPath.section] withRowAnimation:UITableViewRowAnimationTop];
                [self.tableView endUpdates];
            }
            else if (_selectedIndexPath.row != indexPath.row && indexPath.section <= _selectedIndexPath.section){
                
            }
            else
            {
                _isExpand = NO;
                __strong NSIndexPath *copyIndexPath = _selectedIndexPath;
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
                for (UIView *view in cell.contentView.subviews) {
                    if ((view.tag -2000)/100 > 0 && [view isKindOfClass:[UIImageView class]]) {
                        [UIView animateWithDuration:0.7 animations:^{
                            view.alpha = 1;
                        }];
                    }
                    if (view.tag == 1002) {
                        [UIView animateWithDuration:0.7 animations:^{
                            view.alpha = 1;
                        }];
                    }
                }
                _selectedIndexPath = nil;
                [self.tableView beginUpdates];
                [self.tableView deleteRowsAtIndexPaths:[self indexPathsForExpandSection:copyIndexPath.section] withRowAnimation:UITableViewRowAnimationTop];
                [self.tableView endUpdates];
                [self tableView:tableView didSelectRowAtIndexPath:indexPath];
            }
        }
    }
}

-(NSArray *)indexPathsForExpandSection:(NSInteger)section{
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSInteger count = 3+1;
    _selectedRowCount = count;
    for (int i = 1; i <=count ; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    return [indexPaths copy];
}
@end
