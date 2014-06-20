//
//  TagDetailViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 5/6/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TagDetailViewController : UIViewController <CLLocationManagerDelegate>


@property (nonatomic, strong) PFObject* TagDetail;
@property (strong, nonatomic)IBOutlet UILabel *tagname;
@property (nonatomic, strong)IBOutlet UIImageView *immediate;
@property (nonatomic, strong)IBOutlet UIImageView *near;
@property (nonatomic, strong)IBOutlet UIImageView *far;
@property (nonatomic, strong)IBOutlet UIButton *showOnMap;
@property CLLocationManager *locationManager;
@property CLBeaconRegion *rangedRegion;
@property NSUUID *artemisUUID;
@property CLBeaconMajorValue *major;
@property CLBeaconMinorValue *minor;
@property CLBeacon *proximity;
@property (nonatomic,strong) NSMutableDictionary *tags;
@property BOOL notifyOnExit;
@property BOOL notifyOnEntrance;
@property (nonatomic, strong) IBOutlet UISwitch *notifyOnExitSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *notifyOnEntranceSwitch;


@end
