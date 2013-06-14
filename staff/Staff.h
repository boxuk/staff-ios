//
//  Staff.h
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Staff : NSObject

@property (nonatomic) NSString *first;
@property (nonatomic) NSString *last;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *bio;
@property (nonatomic) NSString *role;


- (NSString *)fullName;

@end
