//
//  DetailsActivities.m
//  Tic Talk
//
//  Created by Matthew Davis on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "ActivitiesTab.h"
#import "DBManager.h"
#import "DetailsActivities.h"
#import "EditDetails.h"
#import "AddNewBlock.h"
#import "DBManager.h"
#import "CalendarViewController.h"

@interface DetailsActivities ()

@property NSArray *activities;
@property DBManager *db;

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
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Name: %@",self.isSomethingEnabled.name);
    DBManager *db = [[DBManager alloc]init];
    self.activities = [db getAllActivities];
    Activity *activity = [self.activities objectAtIndex:[self.activityNumber intValue]];
    self.navigationItem.title = activity.name;
    
    db = [[DBManager alloc]init];
    self.activities = [db getAllActivities];
    
    double time = 0;
    NSArray *events = [db getAllEvents];
    for(Event *e in events) {
        NSLog(@"TIME:::    %f", (double) [e.endTime timeIntervalSinceDate:e.startTime]);
        time += (double) [e.endTime timeIntervalSinceDate:e.startTime] / 3600;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 16.0f);
    self.progressBar.transform = transform;
	// Do any additional setup after loading the view.
    float progress = time / [self.isSomethingEnabled.target floatValue];
    [self.progressBar setProgress:progress animated:YES];
    NSLog(@"%f", progress);
    NSLog(@"%@", self.isSomethingEnabled.target);
    self.progressText.text = [NSString stringWithFormat:@"%.2f/%@", time,  self.isSomethingEnabled.target];
    
    CalendarViewController *tbc = (CalendarViewController *)self.childViewControllers[0];
    NSLog(@"tbc");
    //[tbc redrawList];
    
    self.navigationItem.title =[self.isSomethingEnabled valueForKey:@"name"];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"edit"]){
        EditDetails *controller = segue.destinationViewController;
        controller.isSomethingEnabled = self.isSomethingEnabled;
        controller.activityNumber = self.activityNumber;
    }
    if([segue.identifier isEqualToString:@"suckadick"]){
        AddNewBlock *controller = segue.destinationViewController;
        controller.isSomethingEnabled = self.isSomethingEnabled;
        //controller.activityNumber = self.activityNumber;
    }
    NSLog (@"it worked");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
