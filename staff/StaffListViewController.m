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
#import "StaffMemberViewController.h"
#import "/Users/maxwoolf/Documents/personal-projects/staff-ios/Pods/UITableViewCell+FlatUI.h"
#import <QuartzCore/QuartzCore.h>
#import "UIFont+FlatUI.h"
@interface StaffListViewController ()

@end

@implementation StaffListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setTitle:@"Staff List"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [UITableViewCell configureFlatCellWithColor:[UIColor greenSeaColor]
                                         selectedColor:[UIColor cloudsColor]
                                                 style:UITableViewCellStyleValue1
                                       reuseIdentifier:CellIdentifier];
    [[cell textLabel] setFont:[UIFont boldFlatFontOfSize:20]];
    [[cell detailTextLabel] setFont:[UIFont flatFontOfSize:18]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [[cell textLabel] setText:@"Bart Simpson"];
    [[cell detailTextLabel] setText:@"Developer"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StaffMemberViewController *staffVC = [[StaffMemberViewController alloc] init];
    [self.navigationController pushViewController:staffVC animated:YES];
}


@end
