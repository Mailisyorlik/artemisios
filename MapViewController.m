//
//  MapViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/11/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    
    CLLocationCoordinate2D coord;
    coord.longitude = (CLLocationDegrees)-119.813803;
    coord.latitude = (CLLocationDegrees)39.5272;
    [annotation setCoordinate:coord];
    [annotation setTitle:@"Last Seen Location"];
    [self.mapView addAnnotation:annotation];
    
- (void)setGeoPoint:(PFGeoPoint *)geoPoint {
        _coordinate = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
        
        static NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        }
        
        static NSNumberFormatter *numberFormatter = nil;
        if (numberFormatter == nil) {
            numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
            [numberFormatter setMaximumFractionDigits:3];
        }
        
        _title = [dateFormatter stringFromDate:[self.object updatedAt]];
        _subtitle = [NSString stringWithFormat:@"%@, %@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:geoPoint.latitude]],
                     [numberFormatter stringFromNumber:[NSNumber numberWithDouble:geoPoint.longitude]]];
    }
    
    
    
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
