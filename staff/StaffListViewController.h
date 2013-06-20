//
//  StaffListViewController.h
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaffCollection.h"
#import <AddressBookUI/AddressBookUI.h>

@interface StaffListViewController : UITableViewController <StaffCollectionDelegate, UISearchDisplayDelegate, UISearchBarDelegate>
{
    StaffCollection *collection;
}

@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) NSMutableArray *filteredArray;

- (ABRecordRef)getRecordRefForIndexPath:(NSIndexPath *)indexPath;
@end
