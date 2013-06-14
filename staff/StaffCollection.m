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
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (NSDictionary *staff in (NSDictionary *)json) {
        Staff *newStaffMember = [[Staff alloc] init];
        [newStaffMember setFirst:[staff valueForKey:@"first"]];
        [newStaffMember setLast:[staff valueForKey:@"last"]];
        [newStaffMember setEmail:[staff valueForKey:@"email"]];
        [newStaffMember setBio:[staff valueForKey:@"bio"]];
        [newStaffMember setRole:[NSString stringWithFormat:@"%@", [staff valueForKey:@"role"]]];
        [newStaffMember setPhone:[[staff valueForKey:@"phone"] stringByReplacingOccurrencesOfString:@" " withString:@""]];
        [list addObject:newStaffMember];
    }
    staffCollection = [list sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(Staff*)a first];
        NSString *second = [(Staff*)b first];
        return [first compare:second];
    }];
    [delegate didFinishReceivingCollection];
}

@end
