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
