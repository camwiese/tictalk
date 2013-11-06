//
//  DBManager.m
//  Tic Talk
//
//  Created by Wyatt Smith on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "DBManager.h"
#import "Activity.h"
#import <sqlite3.h>

@implementation DBManager

-(void) initDB {
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    self.dbPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"tiktalk.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: self.dbPath] == NO) // If there is no db, create one
    {
        const char *dbpath = [self.dbPath UTF8String];
        
        if (sqlite3_open(dbpath, &_tiktalkDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ACTIVITIES (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, TARGET INTEGER, COLOR INTEGER)";
            NSLog(@"%s", sql_stmt);
            if (sqlite3_exec(self.tiktalkDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            sqlite3_close(self.tiktalkDB);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
}

- (void) insertObject:(Activity *)activity
{
    sqlite3_stmt *statement;
    const char *dbpath = [self.dbPath UTF8String];
    
    if (sqlite3_open(dbpath, &_tiktalkDB) == SQLITE_OK){
        
        
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO ACTIVITIES (name, target, color) VALUES (\"%@\", \"%d\", \"%d\")",
                               activity.name, activity.targetHours, 1];
        
        NSLog(@"%@", insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_tiktalkDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
        } else {
            NSLog(@"Failed to add activity");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_tiktalkDB);
    }
}

- (Activity *) queryActivitiesByName:(NSString *) query {
    const char *dbpath = [self.dbPath UTF8String];
    sqlite3_stmt *statement;
    
    Activity *result;
    
    if (sqlite3_open(dbpath, &_tiktalkDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ACTIVITIES WHERE name=\"%@\"", query];
        NSLog(@"%@", querySQL);
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_tiktalkDB,  query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *name = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSLog(@"Name: %@", name);
                NSString *targetHours = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                NSLog(@"Target: %@", targetHours);
                NSString *color = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                NSLog(@"Color: %@", color);
                result = [[Activity alloc] initWithName:name targetHours:[targetHours intValue] color:[color intValue]];
            } else {
                result = Nil;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_tiktalkDB);
    }
    return result;
}

- (NSMutableArray *) queryAllActivities {
    const char *dbpath = [self.dbPath UTF8String];
    sqlite3_stmt *statement;
    
    NSMutableArray *result;
    
    if (sqlite3_open(dbpath, &_tiktalkDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ACTIVITIES"];
        NSLog(@"%@", querySQL);
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_tiktalkDB,  query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *name = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSLog(@"Name: %@", name);
                NSString *targetHours = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                NSLog(@"Target: %@", targetHours);
                NSString *color = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                NSLog(@"Color: %@", color);
                [result addObject:[[Activity alloc] initWithName:name targetHours:[targetHours intValue] color:[color intValue]]];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_tiktalkDB);
    }
    NSLog(@"ITEMS %lu", (unsigned long)result.count);
    return result;
}

@end
