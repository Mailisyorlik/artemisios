//
//  ArtemisLoginController.m
//  Artemis
//
//  Created by Liam Kilroy on 4/23/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "ArtemisLoginController.h"

@interface ArtemisLoginController ()

@end

@implementation ArtemisLoginController

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
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looksieLogo.png"]]];
    [self.logInView.usernameField setBackgroundColor:[UIColor whiteColor]];
    [self.logInView.passwordField setBackgroundColor:[UIColor whiteColor]];
    [self.logInView.usernameField setTextColor:[UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.]];
    [self.logInView.passwordField setTextColor:[UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.]];
    [self.logInView.usernameField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.logInView.passwordField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.logInView setBackgroundColor:[UIColor colorWithRed:0.100 green:0.280 blue:0.400 alpha:1.]];
    
    
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
