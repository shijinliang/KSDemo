//
//  ViewController.m
//  照相机
//
//  Created by xiaoshi on 16/3/10.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "ViewController.h"
#import "copyLabel.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"打开相机" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openPhotoPicket) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    btn.center = self.view.center;
    [btn sizeToFit];
    [self.view addSubview:btn];
    
    copyLabel *label = [[copyLabel alloc] initWithFrame:CGRectMake(10, 60, 100, 30)];
    label.text = @"测试jk复制";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
}

- (void)openPhotoPicket
{
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImagePickerController *)imagePicker
{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _imagePicker.allowsEditing = YES;
    }
    return _imagePicker;
}

@end
