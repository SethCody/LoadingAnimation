//
//  ViewController.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/20.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYLoadingView *loading = [[SYLoadingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
