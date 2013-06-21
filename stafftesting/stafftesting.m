//
//  stafftesting.m
//  stafftesting
//
//  Created by Max Woolf on 21/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "stafftesting.h"

@implementation stafftesting

- (void)setUp
{
    [super setUp];
    [self setStaff:[[Staff alloc] init]];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


- (void)testFullName
{
    [[self staff] setFirst:@"Max"];
    [[self staff] setLast:@"Woolf"];
    STAssertEqualObjects(@"Max Woolf", [[self staff] fullName], @"-(NSString *)fullName should return first + last");
}

@end
