//
//  AppDelegate.h
//  Artemis
//
//  Created by Liam on 3/18/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;


@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property CLLocationManager *locationManager;



@end
