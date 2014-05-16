//
//  BluetoothFinderTableViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface BluetoothFinderViewController : UIViewController <CLLocationManagerDelegate>
@property (nonatomic,strong) NSMutableDictionary *tags;
@property CLLocationManager *locationManager;
@property CLBeaconRegion *rangedRegion;
@property NSUUID *artemisUUID;




@end
