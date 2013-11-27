//
//  DetailsActivities.m
//  Tic Talk
//
//  Created by Matthew Davis on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "DetailsActivities.h"

@interface DetailsActivities ()

@end

@implementation DetailsActivities

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
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 16.0f);
    self.progressBar.transform = transform;
	// Do any additional setup after loading the view.
    float progress = 4/[self.isSomethingEnabled.target floatValue];
    [self.progressBar setProgress:progress animated:YES];
    NSLog(@"%f", progress);
    NSLog(@"%@", self.isSomethingEnabled.target);
    self.progressText.text = [NSString stringWithFormat:@"4/%@", self.isSomethingEnabled.target];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
