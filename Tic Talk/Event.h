//
//  Event.h
//  Tic Talk
//
//  Created by Wyatt Smith on 11/5/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * startTime;
@property (nonatomic, retain) NSNumber * startDate;
@property (nonatomic, retain) NSNumber * endDate;
@property (nonatomic, retain) NSNumber * endTime;

@end
