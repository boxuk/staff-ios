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
#import <FlatUIKit/UIColor+FlatUI.h>
#import <FlatUIKit/UIFont+FlatUI.h>

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

- (void)didPressCallButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[[self staff] phone]]]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setTitle:[[self staff] fullName]];
    [_nameLbl setFont:[UIFont boldFlatFontOfSize:20.0]];
    [_jobLbl setFont:[UIFont boldFlatFontOfSize:20.0]];
    CALayer *l = [image layer];
    [l setBorderWidth:1.0f];
    [l setBorderColor:[[UIColor midnightBlueColor] CGColor]];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0f];
    [image setImageWithGravatarEmailAddress:[[self staff] email] placeholderImage:nil defaultImageType:KHGravatarDefaultImageMysteryMan rating:KHGravatarRatingG];
    [_nameLbl setText:[[self staff] fullName]];
    [_bioView setFont:[UIFont flatFontOfSize:16.0f]];
    [_bioView setBackgroundColor:[UIColor clearColor]];
    [_bioView setText:[[self staff] bio]];
    [_bioLabel setFont:[UIFont boldFlatFontOfSize:20.0f]];
    
    _emailButton.buttonColor = [UIColor turquoiseColor];
    _emailButton.shadowColor = [UIColor greenSeaColor];
    _emailButton.shadowHeight = 3.0f;
    _emailButton.cornerRadius = 6.0f;
    _emailButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_emailButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [_emailButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    _callButton.buttonColor = [UIColor turquoiseColor];
    _callButton.shadowColor = [UIColor greenSeaColor];
    _callButton.shadowHeight = 3.0f;
    _callButton.cornerRadius = 6.0f;
    _callButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_callButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [_callButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
