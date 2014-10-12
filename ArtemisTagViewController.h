//
//  ArtemisTagViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/23/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>




@interface ArtemisTagViewController : PFQueryTableViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property CLLocationManager *locationManager;
@property CLBeaconRegion *rangedRegion;
@property CLBeaconRegion *beaconRegion;


-(IBAction)addTags:(id)sender;

@end
