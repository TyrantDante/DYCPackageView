//
//  ViewController.m
//  DYCPackage
//
//  Created by DYC on 15/10/10.
//  Copyright © 2015年 DYC. All rights reserved.
//

#import "ViewController.h"
#import "DYCPackageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DYCPackageView *packageView = [[DYCPackageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:packageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
