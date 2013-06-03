//
//  Staff.m
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import "Staff.h"

@implementation Staff
@synthesize first, last;

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", first, last];
}

@end
