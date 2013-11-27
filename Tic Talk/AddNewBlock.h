//
//  AddNewBlock.h
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewBlock : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *startDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDate;
- (IBAction)newBlockPressed:(id)sender;


@end
