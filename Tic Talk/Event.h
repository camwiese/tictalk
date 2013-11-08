//
//  Event.h
//  Tic Talk
//
//  Created by Wyatt Smith on 11/7/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSNumber * endTime;
@property (nonatomic, retain) NSNumber * startTime;
@property (nonatomic, retain) Activity *relationshipToActivity;

@end
