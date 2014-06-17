//
//  NewTagViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 4/24/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewTagViewController : UIViewController
@property (nonatomic, retain) IBOutlet UITextField *tagName;
-(IBAction)saveTag:(id)sender;
@property (nonatomic, assign) id<UIPickerViewDataSource> datasource;
@property (nonatomic, readonly) NSInteger numberOfComponents;
@property (nonatomic)BOOL showSelectionIndicator;


@property CLBeacon *selectedBeacon;

@end
