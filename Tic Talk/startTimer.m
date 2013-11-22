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
    [self.timerz invalidate];
    self.startDate = [[NSDate alloc] init];
    
}
- (IBAction)start:(UIButton*)sender {
    if (self.startDate == nil){
        self.startDate = [[NSDate alloc] init];
    }
    [self timer];
}



- (void) timer {
      self.timerz =  [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(targetMethod:)
                                       userInfo:nil
                                        repeats:YES];
}


- (void) targetMethod: (NSTimer*)sender{
    self.endDate = [[NSDate alloc] init];
    NSTimeInterval interval = [_endDate timeIntervalSinceDate:(_startDate)];
    if (interval > 0){
        NSInteger time = (NSInteger) interval;
        _hours = time / 3060;
        _minutes = time / 60;
        _minutes = _minutes % 60;
        _seconds = time % 60;
    }

    NSString *zero = @"0";
    NSString *hourString = [NSString stringWithFormat:@"%d", _hours];
    if (_hours < 10) hourString = [NSString stringWithFormat:@"%@%d", zero, _hours];
    NSString *spacer = @" : ";
    NSString *minuteString = [NSString stringWithFormat:@"%d", _minutes];
    if (_minutes < 10) minuteString = [NSString stringWithFormat:@"%@%d", zero, _minutes];
    NSString *secondString = [NSString stringWithFormat:@"%d", _seconds];
    if (_seconds< 10) secondString = [NSString stringWithFormat:@"%@%d", zero, _seconds];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
