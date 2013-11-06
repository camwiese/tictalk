//
//  Activity.m
//  Tic Talk
//
//  Created by Wyatt Smith on 10/24/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "Activity.h"

@implementation Activity

- (Activity *)initWithName:(NSString *)name targetHours:(int)targetHours color:(int)color
{
    self = [super init];
    if(self) {
        self.name = name;
        self.targetHours = targetHours;
        self.color = color;
    }
    return self;
}

- (NSString *) getName {
    return self.name;
}

@end
