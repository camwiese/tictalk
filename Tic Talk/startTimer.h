//
//  startTimer.h
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface startTimer : UIViewController

@property bool timerRunning;
@property int hours;
@property int minutes;
@property int seconds;

@property NSDate *endDate;
@property NSDate *diffDate;
@property NSTimer *timerz;

//@property NSString


@end
