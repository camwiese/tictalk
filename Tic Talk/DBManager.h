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

@interface DBManager : NSObject

@property (nonatomic) NSString *dbPath;
@property (nonatomic) sqlite3 *tiktalkDB;

-(void) initDB;
-(void) insertObject:(Activity *) activity;
-(Activity *) queryActivitiesByName:(NSString *) query;

@end
