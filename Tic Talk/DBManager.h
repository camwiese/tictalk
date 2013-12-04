//
//  DBManager.h
//  Tic Talk
//
//  Created by Wyatt Smith on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Activity.h"
#import "Event.h"

@interface DBManager : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

-(void) addActivity:(NSString*)name : (NSNumber*)target :(NSNumber*)color;
-(void)updateActivity:(NSString*)name :(NSNumber*)target :(NSNumber*)color :(NSNumber*)updatedActivityNumber;
-(void) addEvent:(NSDate*)startTime :(NSDate*)endTime;
-(NSArray*) getAllActivities;
-(NSArray*) getAllEvents;
-(void) removeActivity:(NSInteger) index;
-(void) removeEvent:(NSNumber*) index;
-(void) saveData;

@end