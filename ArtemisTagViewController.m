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
    NSLog(@"Adding a new tag");
    
    UIAlertView *tagWindow = [[UIAlertView alloc] initWithTitle:@"Add a new tag"  message:@"What do you want to track?" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
    
    tagWindow.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    [tagWindow show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    
    PFObject *Tag = [PFObject objectWithClassName:@"Tag"];
    Tag[@"Name"] = [[alertView textFieldAtIndex:0] text];
    [Tag saveInBackground];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser]){
        
        ArtemisLoginController *logInViewController = [[ArtemisLoginController alloc] init];
        logInViewController.delegate = self;
        logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsSignUpButton;
        
        
        [self presentViewController:logInViewController animated:NO completion:NULL];
        
        
    }
    
}
-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
[self dismissViewControllerAnimated: YES completion:NULL];
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
