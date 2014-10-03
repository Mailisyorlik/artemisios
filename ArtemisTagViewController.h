//
//  ArtemisTagViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/23/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FYX/FYX.h>
#import <FYX/FYXVisitManager.h>
#import <FYX/FYXTransmitter.h>



@interface ArtemisTagViewController : PFQueryTableViewController<PFLogInViewControllerDelegate, FYXServiceDelegate, FYXVisitDelegate, PFSignUpViewControllerDelegate>
@property CLLocationManager *locationManager;
@property CLBeaconRegion *rangedRegion;
@property CLBeaconRegion *beaconRegion;
@property (nonatomic, retain) FYXVisitManager *visitManager;

-(IBAction)addTags:(id)sender;

@end
