//
//  TagDetailViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 5/6/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "TagDetailViewController.h"

@interface TagDetailViewController ()

@end

@implementation TagDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated]
    [[self.locationManager startRangingBeaconsInRegion: self.rangedRegion]
]}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidAppear:animated]
    [[self.locationManager stopRangingBeaconsInRegion: self.rangedRegion]
]}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tags = [[NSMutableDictionary alloc] init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    self.artemisUUID = [[NSUUID alloc] initWithUUIDString: @"A2F065FF-426E-4043-B45C-861F801BAE2D"];
    
    self.rangedRegion = [[CLBeaconRegion alloc] initWithProximityUUID:self.artemisUUID identifier:self.artemisUUID.UUIDString];
    
}
    
        
    
-(void) locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:
    (CLBeaconRegion *)region
    {
        for(CLBeacon *beacon in beacons)
        {
            if(beacon.proximity == CLProximityImmediate)
            {
                NSLog(@"Show");
                [self performSegueWithIdentifier:@"SelectedTagSegue" sender:beacon];
            }
        } else if(beacon.proximity == CLProximityNear) {
            NSlog(@"Show")
            [self.near setHidden:(NO)]
            [self.immeditate setHidden: (YES)]
            [self.far setHidden: (YES)]
        }
    }   else if(beacon.proximity == CLProximityFar) {
        NSlog(@"Show")
        [self.near setHidden:(YES)]
        [self.immediate setHidden: (YES)]
        [self.far setHidden: (NO)]
    }
        else if(beacon.proximity == CLProximityImmediate) {
        NSLog(@"Show")
            [self.near setHidden:(YES)]
            [self.immediate setHidden:(NO)]
            [self.far setHidden:(YES)]
            
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
