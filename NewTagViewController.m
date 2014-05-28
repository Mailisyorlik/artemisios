//
//  NewTagViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "NewTagViewController.h"
#import "AppDelegate.h"


@interface NewTagViewController ()


@end

@implementation NewTagViewController




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
    
    self.title = [NSString stringWithFormat:@"Artemis Tag %@.%@", self.selectedBeacon.major, self.selectedBeacon.minor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    

}


-(void)dismissKeyboard {
    [self.tagName resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
    
}

- (IBAction)saveTag:(id)sender
{
    PFObject *newTag = [PFObject objectWithClassName:@"Tag"];
    newTag[@"Name"] = self.tagName.text;
    newTag[@"UUID"] = self.selectedBeacon.proximityUUID.UUIDString;
    newTag[@"Major"] = self.selectedBeacon.major;
    newTag[@"Minor"] = self.selectedBeacon.minor;
    
    
    
    if ( [self.tagName.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Artemis" message:@"Cannot save tag without name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
        
    }
    else {
       
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        delegate.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        delegate.locationManager.distanceFilter = kCLDistanceFilterNone;
        [delegate.locationManager startUpdatingLocation];
        CLLocationCoordinate2D coordinate = [[delegate.locationManager location] coordinate];
        PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        [newTag setObject:geoPoint forKey:@"LastLocation"];
        
        
            newTag.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            [newTag saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    }

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