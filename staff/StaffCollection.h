//
//  StaffCollection.h
//  staff
//
//  Created by Max Woolf on 03/06/2013.
//  Copyright (c) 2013 BoxUK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Staff.h"

@class StaffCollection;
@protocol StaffCollectionDelegate <NSObject>

- (void)didFinishReceivingCollection;

@end

@interface StaffCollection : NSObject <NSURLConnectionDataDelegate>
{
    NSMutableData *receivedData;
    id delegate;
    NSMutableArray *staffCollection;
}

- (id)initWithAllStaffMembers;
- (void)connectToAPI;

@property (nonatomic) id delegate;
@property (nonatomic) NSMutableArray *staffCollection;

@end
