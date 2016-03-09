//
//  KSLocation.h
//  画板
//
//  Created by xiaoshi on 16/3/9.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLPlacemark;
@interface KSLocation : NSObject

typedef void(^locationBlock)(CLPlacemark *placemark);

@property (nonatomic ,copy)locationBlock block;
+ (instancetype)instance;
- (void)getLocation:(locationBlock)block;
@end
