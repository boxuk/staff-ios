//
//  StaffDisplayViewController.h
//  staff
//
//  Created by Max Woolf on 09/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"
#import <FlatUIKit/FUIButton.h>
#import <MessageUI/MessageUI.h>

@interface StaffDisplayViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    IBOutlet UIImageView *image;
    IBOutlet UILabel *_nameLbl;
    IBOutlet UILabel *_jobLbl;
    IBOutlet UITextView *_bioView;
    IBOutlet UILabel *_bioLabel;
    IBOutlet FUIButton *_emailButton;
    IBOutlet FUIButton *_callButton;
}

@property Staff *staff;

- (IBAction)didPressCallButton:(id)sender;
- (IBAction)didPressEmailButton:(id)sender;

@end
