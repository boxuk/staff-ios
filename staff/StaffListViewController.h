//
//  StaffListViewController.h
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaffCollection.h"

@interface StaffListViewController : UITableViewController <StaffCollectionDelegate>
{
    StaffCollection *collection;
}
@end
