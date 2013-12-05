//
//  Event.h
//  Tic Talk
//
//  Created by Wyatt Smith on 12/4/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Activity.h"

@class Activity;

@interface Event : Activity

@property (nonatomic, retain) NSDate * endTime;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) Activity *relationshipToActivity;

@end
