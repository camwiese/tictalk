//
//  Activity.h
//  Tic Talk
//
//  Created by Wyatt Smith on 10/24/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject
@property NSString *name;
@property int targetHours;
@property int color;

- (Activity *)initWithName:(NSString *)name targetHours:(int)targetHours color:(int)color;

@end
