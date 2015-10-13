//
//  DYCHeaderFooterView.h
//  DYCPackage
//
//  Created by DYC on 15/10/12.
//  Copyright © 2015年 DYC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYCHeaderFooterView;
@protocol DYCHeaderFooterViewDelegate<NSObject>
-(void)headerFooterView:(DYCHeaderFooterView *)headerFooterView addToCart:(UIButton *)button;
@end
@interface DYCHeaderFooterView : UITableViewHeaderFooterView
@property (strong,nonatomic) id packageData;
@end
