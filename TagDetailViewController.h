//
//  TagDetailViewController.h
//  Artemis
//
//  Created by Liam Kilroy on 5/6/14.
//  Copyright (c) 2014 artemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TagDetailViewController : UIViewController
@property (nonatomic, strong) PFObject* TagDetail;
@property (strong, nonatomic)IBOutlet UILabel *tagname;
@property (nonatomic, strong)IBOutlet UIImageView *immediate;
@property (nonatomic, strong)IBOutlet UIImageView *near;
@property (nonatomic, strong)IBOutlet UIImageView *far;

@end
