//
//  MapViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/11/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
 
@property (strong, nonatomic)IBOutlet  MKMapView *mapView;
@property (nonatomic, strong) PFObject* TagDetail;
@property CLLocationManager *locationManager;

@property CLBeaconRegion *rangedRegion;
@property NSUUID *artemisUUID;
@property CLBeaconMajorValue *major;
@property CLBeaconMinorValue *minor;
@property CLBeacon *proximity;
@property CLBeacon *beacon;
@property (nonatomic,strong) NSMutableDictionary *tags;
@property CLLocationCoordinate2D *location;




@end
