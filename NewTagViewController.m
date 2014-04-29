//
//  NewTagViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "NewTagViewController.h"


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
    
    
}





- (IBAction)saveTag:(id)sender
{
    PFObject *newTag = [PFObject objectWithClassName:@"Tag"];
    newTag[@"Name"] = self.tagName.text;
    newTag[@"UUID"] = @"something";
    
    
    newTag.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [newTag saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    


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