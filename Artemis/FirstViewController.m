//
//  FirstViewController.m
//  Artemis
//
//  Created by Liam on 3/18/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [[self usernameLabel] setText:@"Welcome"];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![usernameLabel currentUser]) { //no user logged in
        //Create the log in view controller
        PFLogInViewController *FirstViewController = [[PFLogInViewController alloc] init]
        [logInViewController set delegate:self]; //Set ourselves as the deleagate
        
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)movetext:(id)sender
{
    NSLog(@"button pressed %@ ", self.artemistextbox.text);
    [[self usernameLabel] setText:self.artemistextbox.text];
    
}










@end
