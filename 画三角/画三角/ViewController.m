//
//  ViewController.m
//  画三角
//
//  Created by xiaoshi on 16/3/10.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "ViewController.h"
#import "view1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    view1 *v1 = [[view1 alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    [self.view addSubview:v1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
