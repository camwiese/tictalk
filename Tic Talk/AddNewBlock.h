//
//  AddNewBlock.h
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface AddNewBlock : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *startDate;
@property (strong, nonatomic) IBOutlet UIDatePicker *endDate;
@property Activity *isSomethingEnabled;
@property (nonatomic)NSNumber *activityNumber;


@end
