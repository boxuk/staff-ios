//
//  StaffDisplayViewController.h
//  staff
//
//  Created by Max Woolf on 09/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"

@interface StaffDisplayViewController : UIViewController
{
    IBOutlet UIImageView *image;
    IBOutlet UILabel *_nameLbl;
}

@property Staff *staff;

@end
