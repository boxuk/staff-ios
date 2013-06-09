//
//  StaffCollection.m
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "StaffCollection.h"
#import "Staff.h"

@implementation StaffCollection
@synthesize delegate, staffCollection;

- (id)initWithAllStaffMembers
{
    staffCollection = [[NSMutableArray alloc] init];
    return [super init];
}


- (void)connectToAPI
{
    NSURL *url = [NSURL URLWithString:@"http://staffapp.herokuapp.com/api/employees"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *staff in (NSDictionary *)json) {
        Staff *newStaffMember = [[Staff alloc] init];
        [newStaffMember setFirst:[staff valueForKey:@"first"]];
        [newStaffMember setLast:[staff valueForKey:@"last"]];
        [newStaffMember setEmail:[staff valueForKey:@"email"]];
        [newStaffMember setBio:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam placerat neque ut massa varius, nec volutpat mauris porta. Praesent lacinia placerat luctus. Duis nec quam eget erat tincidunt interdum sed vel tellus. Cras at iaculis purus. Fusce lacinia libero non lorem laoreet, nec imperdiet nunc porttitor. Sed feugiat nisi semper, fermentum mauris eget, rutrum augue. Nunc mattis orci massa, ac imperdiet metus euismod ut. Donec venenatis mi et arcu aliquam scelerisque. Donec sagittis laoreet massa, at sagittis sapien. Vestibulum sed nisi et ipsum dictum fringilla."];
        [newStaffMember setPhone:[[staff valueForKey:@"phone"] stringByReplacingOccurrencesOfString:@" " withString:@""]];
        [staffCollection addObject:newStaffMember];
    }
    [delegate didFinishReceivingCollection];
}

@end
