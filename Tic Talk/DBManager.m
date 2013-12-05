//
//  DBManager.m
//  Tic Talk
//
//  Created by Wyatt Smith on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "DBManager.h"
#import "Activity.h"
#import "Event.h"
#import <sqlite3.h>
#import <CoreData/CoreData.h>


@implementation DBManager

@synthesize managedObjectContext = managedObjectContext;
@synthesize managedObjectModel = managedObjectModel;
@synthesize persistentStoreCoordinator = persistentStoreCoordinator;

- (NSManagedObjectContext *) managedObjectContext {
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"PhoneBook.sqlite"]];
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                  initWithManagedObjectModel:[self managedObjectModel]];
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}



- (void)addActivity:(NSString*)name :(NSNumber*)target :(NSNumber*) color
{
    Activity * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:self.managedObjectContext];
    newEntry.name = name;
    newEntry.target = target;
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    } else {
        NSLog(@"SUCCESS!!!! - Activity Saved");
    }
}

-(void)updateActivity:(NSString*)name :(NSNumber*)target :(NSNumber*)color :(NSNumber*)updatedActivityNumber
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Activity" inManagedObjectContext:context]];
    NSLog(@"SUCCESS!!!! - Request Succeeded");
    NSError *errorFetch = nil;
    NSArray *results = [context executeFetchRequest:request error:&errorFetch];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSLog(@"name == %@", name);
    
    [request setPredicate:predicate];
    NSLog(@"results == %@", results);
    
    
    
    //Update the activity!
    Activity* activityBeingUpdated = [results objectAtIndex:[updatedActivityNumber intValue]];
    activityBeingUpdated.name = name;
    activityBeingUpdated.target = target;
    //activityBeingUpdated.color = color;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    } else {
        NSLog(@"SUCCESS!!!! - Activity Edited");
    }
}

- (void)addEvent:(NSDate*)startTime :(NSDate*)endTime :(Activity*) activity
{
    Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    event.startTime = startTime;
    event.endTime = endTime;
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    } else {
        NSLog(@"SUCCESS!!!! - Event Saved");
    }
    [self saveData];
    //event.relationshipToActivity = activity;
    [self saveData];
}

-(NSArray*)getAllActivities
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *fuckthisbullshit = [[NSMutableArray alloc] init];
    for (Activity *e in fetchedRecords){
        if (e.name != nil) {
            [fuckthisbullshit addObject:e ];
        }
    }
    return fuckthisbullshit;
}

-(NSArray*)getAllEvents
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSLog(@"%@", error);

    return fetchedRecords;
}

-(void) removeActivity:(NSInteger) index {
    NSArray *temp = [self getAllActivities];
    [self.managedObjectContext deleteObject:[temp objectAtIndex:index]];
    NSError * error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}

-(void) removeEvent:(Event*) event {
    NSError * error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}

-(void) saveData {
    NSError * error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"ERROR UPDATING! %@ %@", error, [error localizedDescription]);
        return;
    }
}

@end