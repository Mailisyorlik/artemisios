//
//  ArtemisTagViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/23/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "ArtemisTagViewController.h"
#import "ArtemisLoginController.h"
#import "ArtemisSignUpController.h"
#import "BluetoothFinderViewController.h"
#import "TagDetailViewController.h"

@interface ArtemisTagViewController ()

@end

@implementation ArtemisTagViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    if (self) {
        //custom the table
        
        self.parseClassName = @"Tag";
        
        self.textKey = @"Name";
        
        self.title = @"Tags";
        
        self.pullToRefreshEnabled = YES;
        

        
        
        
    }
    return self;
    
    
}
-(IBAction)addTags:(id)sender
{

    
                                                           
    [self performSegueWithIdentifier:@"BLESegue" sender:nil];
    
    
    

}


    
    
    


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser]){
        
        ArtemisLoginController *logInViewController = [[ArtemisLoginController alloc] init];
        logInViewController.delegate = self;
        logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsSignUpButton;
        
        
        [self presentViewController:logInViewController animated:NO completion:NULL];
        
    
    }
    else {
        
        [self loadObjects];
        
        
        
        
    }
}







-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
[self dismissViewControllerAnimated: YES completion:NULL];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"TagDetailSegue" sender:nil];
}


// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle ==  UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
            // Remove the row from data model
            PFObject *object = [self.objects objectAtIndex:indexPath.row];
            [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                //ask parse for all data
                [self loadObjects];
                [self.locationManager stopMonitoringForRegion:(self.beaconRegion)];
            }];
    }

}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"TagDetailSegue"]) {
        // Row selection
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        TagDetailViewController *controller = (TagDetailViewController*)[segue destinationViewController];
        [controller setTagDetail: object];
        
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
