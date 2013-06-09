//
//  StaffDisplayViewController.m
//  staff
//
//  Created by Max Woolf on 09/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "StaffDisplayViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <UIImageView+KHGravatar.h>
#import <QuartzCore/QuartzCore.h>

@interface StaffDisplayViewController ()

@end

@implementation StaffDisplayViewController

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
    // Do any additional setup after loading the view from its nib.
    CALayer *l = [image layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0f];
    [image setImageWithGravatarEmailAddress:@"maximus@zingysaturn.co.uk"];
}
     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
