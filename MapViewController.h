//
//  MapViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/11/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic)IBOutlet  MKMapView *mapView;

@end
