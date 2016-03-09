//
//  KSViewController.m
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSViewController.h"
#import "KSView.h"
#import "UIImage+KSCaptureView.h"
#import <CoreLocation/CoreLocation.h>
#import "KSLocation.h"

@interface KSViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) UIButton *clearBtn;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *saveBtn;
@property (nonatomic, strong) KSView *ksView;

@property (nonatomic, strong) CLLocationManager *location;
@property (nonatomic, copy) UIColor *currentColor;
@property (nonatomic, strong) UIButton *leftBtn;
@end

@implementation KSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CLLocationManager *location = [[CLLocationManager alloc] init];
    location.desiredAccuracy = kCLLocationAccuracyBest;
    [location requestWhenInUseAuthorization];
    location.delegate = self;
    self.location = location;
    self.navigationItem.title = @"画板";
    [self.view addSubview:self.ksView];
    [self.view addSubview:self.clearBtn];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.saveBtn];
    //设置默认颜色为白色
    _currentColor = [UIColor whiteColor];
    [self setNavigation];
    [self getLocation];
}

- (void)setNavigation
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"获取位置……" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    [leftBtn addTarget:self action:@selector(getLocation) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftBtn;
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)getLocation
{
    [[KSLocation instance] getLocation:^(CLPlacemark *placemark) {
        NSString *city = placemark.locality;
        if (!city) {
            city = placemark.subLocality;
        }
        [_leftBtn setTitle:city forState:UIControlStateNormal];
        [_leftBtn sizeToFit];
    }];
}

- (void)clearView
{
    [self.ksView clearView];
}

- (void)backView
{
    [self.ksView backView];
}

- (void)saveView
{
    UIImage *image = [UIImage KSCaptureImageWithView:self.ksView];
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (KSView *)ksView
{
    if (!_ksView) {
        _ksView = [[KSView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 50)];
        _ksView.backgroundColor = [UIColor redColor];
    }
    return _ksView;
}

- (UIButton *)clearBtn
{
    if (!_clearBtn) {
        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearBtn.frame = CGRectMake(0, ScreenHeight - 50, ScreenWidth / 3, 50);
        [_clearBtn setTitle:@"清除" forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(ScreenWidth/3, ScreenHeight - 50, ScreenWidth/3, 50);
        [_backBtn setTitle:@"撤销" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIButton *)saveBtn
{
    if (!_saveBtn) {
        _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveBtn.frame = CGRectMake(ScreenWidth/3*2, ScreenHeight - 50, ScreenWidth/3, 50);
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(saveView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBtn;
}


@end
