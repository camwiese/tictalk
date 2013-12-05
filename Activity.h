//
//  Activity.h
//  Tic Talk
//
//  Created by Wyatt Smith on 12/4/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * target;

@end
