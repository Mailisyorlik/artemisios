//
//  FirstViewController.h
//  Artemis
//
//  Created by Liam on 3/18/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UITextField *artemistextbox;
-(IBAction)movetext:(id)sender;


@end

