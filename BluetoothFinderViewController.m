//
//  BluetoothFinderTableViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "BluetoothFinderViewController.h"
#import "NewTagViewController.h"
#import "AppDelegate.h"

@interface BluetoothFinderViewController ()

@end

@implementation BluetoothFinderViewController

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

    self.tags = [[NSMutableDictionary alloc] init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    self.artemisUUID = [[NSUUID alloc] initWithUUIDString: @"A2F065FF-426E-4043-B45C-861F801BAE2D"];
    
    self.rangedRegion = [[CLBeaconRegion alloc] initWithProximityUUID:self.artemisUUID identifier:self.artemisUUID.UUIDString];
    
    
    
}
-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.locationManager startRangingBeaconsInRegion: self.rangedRegion];
    
    
}
-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    [self.locationManager stopRangingBeaconsInRegion: self.rangedRegion];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



    
   // [self performSegueWithIdentifier:@"SelectedTagSegue" sender:[self.tags objectAtIndex:indexPath.row]];

    
    
    
    




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
#pragma mark - Location manager delegate

-(void) locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:
(CLBeaconRegion *)region
{
    for(CLBeacon *beacon in beacons)
    {
        if(beacon.proximity == CLProximityImmediate)
        {
            NSLog(@"ADD THIS TAG");
            [self.locationManager stopRangingBeaconsInRegion: self.rangedRegion];
            [self performSegueWithIdentifier:@"SelectedTagSegue" sender:beacon];
            
        }
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SelectedTagSegue"]){
        
        NewTagViewController *controller = (NewTagViewController*)[segue destinationViewController];
        controller.selectedBeacon = sender;
        
    }
    
    
        
}


@end
