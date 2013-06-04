//
//  staffTests.m
//  staffTests
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "staffTests.h"
#import "Staff.h"

@implementation staffTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in staffTests");
}

- (void)testFullNameReturnsTheFullName
{
    Staff *staff = [[Staff alloc] init];
    [staff setFirst:@"Max"];
    [staff setLast:@"Woolf"];
    STAssertEqualObjects(@"Max Woolf", [staff fullName], @"fullName should return the first and last name concatenated with a space");
}

@end
