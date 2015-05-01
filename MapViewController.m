//
//  MapViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/11/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController()

@end

@implementation MapViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
 
    
        [self.mapView.delegate self];
        [self.mapView setShowsUserLocation:YES];
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        CLLocationCoordinate2D coord;
        [annotation setCoordinate: coord];
        [annotation setTitle:@""];
        [self.mapView addAnnotation:annotation];
        //still needs to pull data from parse for name and date
        
    
    
    
}
- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self locationManager] requestWhenInUseAuthorization];
    
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    

    
    
    PFQuery *query = [PFQuery queryWithClassName: @"Tag"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            NSLog(@"%lu", (unsigned long)[objects count]);
            [allTags addObjectsFromArray:objects];
            
             for(PFObject *currentTag in allTags) {
                 NSLog(@"%@", currentTag[@"title"]);
             }
        }
    }];
    
    
   
    
  
    
    //within the above lines, the code for lat long may have to be changed to drop the pin at the lat long location of the phone when the tag leaves range
  
    
    
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
