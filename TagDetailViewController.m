//
//  TagDetailViewController.m
//  Artemis
//
//  Created by Liam Kilroy on 5/6/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import "TagDetailViewController.h"

@interface TagDetailViewController ()

@end

@implementation TagDetailViewController

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
    self.tagname.text = [self.TagDetail objectForKey:@"Name"];
    self.title = [self.TagDetail objectForKey:@"Name"];
    
    NSString *distance = @"near";
   
    
    if ([distance isEqualToString:@"near"]) {
        [self.near setHidden:(NO)];
        [self.far setHidden:(YES)];
        [self.immediate setHidden:(YES)];
        
    
    }
    else if ([distance isEqualToString:@"far"]) {
       
        [self.near setHidden:(YES)];
        [self.far setHidden:(NO)];
        [self.immediate setHidden:(YES)];
        
    }
    else if ([distance isEqualToString:@"immediate"]) {
       
        [self.near setHidden: (YES)];
        [self.far setHidden: (YES)];
        [self.immediate setHidden: (NO)];
        
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
