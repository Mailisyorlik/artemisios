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


- (void)peripheralManager:(CBPeripheralManager *)peripheral
            didAddService:(CBService *)service
                    error:(NSError *)error {
    
    if (error) {
        NSLog(@"Error publishing service: %@", [error localizedDescription]);
    }


}




- (void)viewDidAppear:(BOOL)animated {
        [super viewDidAppear:animated];
        [self.locationManager startRangingBeaconsInRegion: self.rangedRegion];
    [self.locationManager startMonitoringForRegion:self.rangedRegion];
     }


- (void)viewDidDisappear:(BOOL)animated {
        [super viewDidAppear:animated];
        [self.locationManager stopRangingBeaconsInRegion: self.rangedRegion];

    }


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tags = [[NSMutableDictionary alloc] init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    self.artemisUUID = [[NSUUID alloc] initWithUUIDString: @"A2F065FF-426E-4043-B45C-861F801BAE2D"];
    
    self.title = [self.TagDetail objectForKey:@"Name"];
    
    self.rangedRegion = [[CLBeaconRegion alloc] initWithProximityUUID:self.artemisUUID major:[[self.TagDetail objectForKey:@"Major"] intValue] minor:[[self.TagDetail objectForKey:@"Minor"] intValue] identifier:self.artemisUUID.UUIDString];
  
    
    NSLog(@"regions are %@", [self.locationManager monitoredRegions]);
    
        if (self.rangedRegion) {
       
        self.notifyOnEntrance = self.rangedRegion.notifyOnEntry;
        self.notifyOnExit = self.rangedRegion.notifyOnExit;
        self.major = self.rangedRegion.major;
        self.minor = self.rangedRegion.minor;
        self.artemisUUID = self.rangedRegion.proximityUUID;
        
        
        
        
        
    }
    else
    {
        self.notifyOnEntrance = self.notifyOnExit = NO;
       
        self.major = nil;
        
        self.minor = nil;
        
        self.artemisUUID = [[NSUUID alloc] initWithUUIDString: @"A2F065FF-426E-4043-B45C-861F801BAE2D"];


    
        
        
    }
    
    
    self.leashRegion=self.rangedRegion;

    [self.notifyOnEntranceSwitch setOn:self.rangedRegion.notifyOnEntry];
}


-(void)updateMonitoredRegion
{
   if(self.rangedRegion)
   {
       self.rangedRegion.notifyOnEntry = self.notifyOnEntrance;
       self.rangedRegion.notifyOnExit = NO;
       
       [self.locationManager startMonitoringForRegion:self.rangedRegion];
        
   }
}




 -(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.notifyOnEntranceSwitch.on = self.notifyOnEntrance;
    
}
    
-(void) locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:
    (CLBeaconRegion *)region
    {
        NSLog(@"Ranged %lu", (unsigned long)[beacons count]);
        
        
        for(CLBeacon *beacon in beacons)
        {
            
        
        if(beacon.proximity == CLProximityNear) { //End first if, start if else
                        NSLog(@"Show Near");
                        [self.near setHidden:NO];
                        [self.immediate setHidden: YES];
                        [self.far setHidden: YES];
    } else if(beacon.proximity == CLProximityFar) { //END THE 2nd, start the 3rd
                        NSLog(@"Show Far");
                        [self.near setHidden:YES];
                        [self.immediate setHidden: YES];
                        [self.far setHidden: NO];
    } else if(beacon.proximity == CLProximityImmediate) { //end the 3rd, start the 4th
                        NSLog(@"Show Immediate");
                        [self.near setHidden:YES];
                        [self.immediate setHidden:NO];
                        [self.far setHidden:YES];
        
    
        
        
        }  //END THE 4th IF statement
            
    else {
        NSLog(@"Not found beacon");
        [self.near setHidden:(YES)];
        [self.immediate setHidden:(YES)];
        [self.far setHidden:(YES)];
        
    }
        
    } // END the FOR LOOP
    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)toggleNotifyExitLeash:(UISwitch *)sender{
   /* self.notifyOnExit = sender.on;
    
    //set update monitered region
    NSLog(@"Toggled the switch for leash");
    
    if(self.notifyOnExit)
    {
        NSLog(@"Start monitoring for background enter and exit");
        self.leashRegion.notifyOnExit = self.notifyOnExit;
        self.leashRegion.notifyOnEntry = self.notifyOnExit;
        
        [self.locationManager stopMonitoringForRegion:self.leashRegion];
        
    }
  */
}
-(IBAction)toggleNotifyEnterLeash:(UISwitch *)sender{
    self.notifyOnEntrance = sender.on;
    
    [self updateMonitoredRegion];
    
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
