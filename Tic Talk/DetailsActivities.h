//
//  DetailsActivities.h
//  Tic Talk
//
//  Created by Matthew Davis on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface DetailsActivities : UIViewController
@property (nonatomic) Activity *isSomethingEnabled;
@property (nonatomic)NSNumber *activityNumber;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *progressText;
//@property (weak, nonatomic) IBOutlet UIView *table;

@end
