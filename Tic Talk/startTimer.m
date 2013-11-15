//
//  startTimer.m
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "startTimer.h"

@interface startTimer ()

@end

@implementation startTimer
- (IBAction)stop:(UIButton*)sender {
    _timerRunning = true;
}
- (IBAction)start:(UIButton*)sender {
    _timerRunning = false;
}

- (void) timer {
    while (_timerRunning == true)
    {
        
    }
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
