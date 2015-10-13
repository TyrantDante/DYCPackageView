//
//  DYCHeaderFooterView.m
//  DYCPackage
//
//  Created by DYC on 15/10/12.
//  Copyright © 2015年 DYC. All rights reserved.
//

#import "DYCHeaderFooterView.h"
@interface DYCHeaderFooterView()
@property (weak,nonatomic) UILabel *packagePriceLabel;
@property (weak,nonatomic) UILabel *originalPriceLabel;
@property (weak,nonatomic) UILabel *savePriceLabel;
@property (weak,nonatomic) UIButton *addToCartButton;

@end
@implementation DYCHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews
{
    UILabel *packagePriceLabel = [[UILabel alloc] init];
    packagePriceLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:packagePriceLabel];
    _packagePriceLabel = packagePriceLabel;
    _packagePriceLabel.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height);
    NSLog(@"self %f,%f",self.frame.size.width,self.frame.size.height);
    NSLog(@"_package %f,%f",_packagePriceLabel.frame.size.width,_packagePriceLabel.frame.origin.y);
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _packagePriceLabel.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height);
    NSLog(@"self %f,%f",self.frame.size.width,self.frame.size.height);
    NSLog(@"self contentView %f,%f",self.contentView.frame.size.width,self.contentView.frame.size.height);
    NSLog(@"_package %f,%f",_packagePriceLabel.frame.size.width,_packagePriceLabel.frame.origin.y);
}
@end
