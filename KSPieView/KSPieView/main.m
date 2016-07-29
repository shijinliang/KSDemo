//
//  main.m
//  KSPieView
//
//  Created by xiaoshi on 16/3/10.
//  Copyright © 2016年 kamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        struct point {
            int x;
            int y;
        };
        typedef struct point POINT;
        POINT p;
        p.x = 5;
        p.y = 12;
        NSLog(@"%d   %d",p.x,p.y);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
