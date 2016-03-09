//
//  KSLocation.m
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import "KSLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface KSLocation()<CLLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager *manager;
@end

@implementation KSLocation

+ (instancetype)instance
{
    static KSLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[KSLocation alloc] init];
    });
    return location;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"asdasd");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count>0) {
            CLPlacemark *placeMark = [placemarks objectAtIndex:0];
            self.block(placeMark);
        } else {
            
        }
    }];
    [manager stopUpdatingLocation];
}

- (CLLocationManager *)manager
{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        [_manager requestWhenInUseAuthorization];
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _manager;
}

- (void)getLocation:(locationBlock)block
{
    self.block = block;
    if ([CLLocationManager locationServicesEnabled]) {
        [self.manager startUpdatingLocation];
    }
}



@end
