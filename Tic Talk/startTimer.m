//
//  startTimer.m
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "startTimer.h"

@interface startTimer ()
@property (weak, nonatomic) IBOutlet UILabel *timerDisplay;


@end

@implementation startTimer
- (IBAction)stop:(UIButton*)sender {
    _timerRunning = false;
    
}
- (IBAction)start:(UIButton*)sender {
    _timerRunning = true;
    if (self.startDate == nil){
        self.startDate = [[NSDate alloc] init];
    }
    [self timer];
}



- (void) timer {
    if (_timerRunning == true)
    {
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(targetMethod:)
                                       userInfo:nil
                                        repeats:YES];
    }
}

- (void) targetMethod: (NSTimer*)sender{
//    self.endDate = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:_startDate];

    
    NSString *hourString = [NSString stringWithFormat:@"%d", _hours];
    NSString *spacer = @" : ";
    NSString *minuteString = [NSString stringWithFormat:@"%d", _minutes];
    NSString *secondString = [NSString stringWithFormat:@"%d", _seconds];
    NSString *combined = [NSString stringWithFormat:@"%@%@%@%@%@", hourString, spacer, minuteString, spacer, secondString];
    _timerDisplay.text = combined;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _hours = 10;
    _minutes = 10;
    _seconds = 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
