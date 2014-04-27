//
//  NewTagViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "NewTagViewController.h"


@interface NewTagViewController ()
@property NSString *tagName;

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

- (IBAction)save:(id)sender {
    // Create PFObject with tag information
    PFObject *tag = [PFObject objectWithClassName:@"TagName"];
    
    
    NSArray *ingredients = [NewTagViewController.text componentsSeparatedByString: @","];
    [tag setObject:name forKey:@"tag"];



(void)NewTagViewController:(PFNewTagViewController *)NewTagController didSaveObject:(PFObject *)user {
    [self dismissViewControllerAnimated: YES completion:NULL];
    
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