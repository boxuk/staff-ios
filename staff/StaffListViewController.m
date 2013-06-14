//
//  StaffListViewController.m
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "StaffListViewController.h"
#import <FlatUIKit/UIColor+FlatUI.h>
#import <FlatUIKit/UINavigationBar+FlatUI.h>
#import <FlatUIKit/UIBarButtonItem+FlatUI.h>
#import <AddressBookUI/AddressBookUI.h>
#import <QuartzCore/QuartzCore.h>
#import "UIFont+FlatUI.h"
#import "StaffDisplayViewController.h"
#import "StaffCollection.h"
@interface StaffListViewController ()

@end

@implementation StaffListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setTitle:@"Staff List"];
        collection = [[StaffCollection alloc] initWithAllStaffMembers];
        [collection setDelegate:self];
        [collection connectToAPI];
    }
    return self;
}

- (void)didFinishReceivingCollection
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[collection staffCollection] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [UITableViewCell configureFlatCellWithColor:[UIColor belizeHoleColor]
                                         selectedColor:[UIColor cloudsColor]
                                                 style:UITableViewCellStyleValue1
                                       reuseIdentifier:CellIdentifier];
    [[cell textLabel] setFont:[UIFont boldFlatFontOfSize:20]];
    [[cell detailTextLabel] setFont:[UIFont flatFontOfSize:18]];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [[cell textLabel] setText:[[[collection staffCollection] objectAtIndex:indexPath.row] fullName]];
    [[cell detailTextLabel] setText:[[[collection staffCollection] objectAtIndex:indexPath.row] role]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    ABPersonViewController *staffVC = [[ABPersonViewController alloc] init];
//    [staffVC setDisplayedProperties:[NSArray arrayWithObjects:
//                                      [NSNumber numberWithInt:kABPersonEmailProperty],
//                                                              nil]];
    StaffDisplayViewController *staffVC = [[StaffDisplayViewController alloc] init];
    [staffVC.view setBackgroundColor:[UIColor cloudsColor]];
    [staffVC setStaff:[[collection staffCollection] objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:staffVC animated:YES];
}

-(ABRecordRef)getRecordRefForIndexPath:(NSIndexPath *)indexPath
{
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.gardenofwales.org.uk/wp-content/gallery/igpoty-2/image10_xl.jpg"]];
    ABRecordRef ref = ABPersonCreate();
    ABPersonSetImageData(ref, (__bridge CFDataRef)(imageData), nil);
    ABRecordSetValue(ref, kABPersonFirstNameProperty, (__bridge CFTypeRef)([[[collection staffCollection] objectAtIndex:indexPath.row] first]), nil);
    ABRecordSetValue(ref, kABPersonLastNameProperty, (__bridge CFTypeRef)([[[collection staffCollection] objectAtIndex:indexPath.row] last]), nil);
    ABMutableMultiValueRef emailMultiValue = ABMultiValueCreateMutable(kABPersonEmailProperty);
    ABMultiValueAddValueAndLabel(emailMultiValue, (__bridge CFTypeRef)([[[collection staffCollection] objectAtIndex:indexPath.row] email]), kABWorkLabel, NULL);
    ABRecordSetValue(ref, kABPersonEmailProperty, emailMultiValue, nil);
    ABRecordSetValue(ref, kABPersonJobTitleProperty, @"Developer", nil);
    return ref;
}


@end
