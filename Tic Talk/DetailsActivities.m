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

- (void) convertBlockNSDateToHoursMinutes
{
    //endDate;
    //startDate;
    
    
    //NSCalendar *calendar = [NSCalendar currentCalendar];
    //NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    //NSInteger hour = [components hour];
    //NSInteger minute = [components minute];
    
    
    /*
     NSDate *dateA;
     NSDate *dateB;
     
     NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
     NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
     fromDate:dateA
     toDate:dateB
     options:0];
     */
    
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
    DBManager *db = [[DBManager alloc]init];
    self.activities = [db getAllActivities];
    
    self.navigationItem.title =[self.isSomethingEnabled valueForKey:@"name"];
    
//    float progress = 4/[self.isSomethingEnabled.target floatValue];
//    [self.progressBar setProgress:progress animated:YES];
//    NSLog(@"%f", progress);
//    NSLog(@"%@", self.isSomethingEnabled.target);
//    self.progressText.text = [NSString stringWithFormat:@"4/%@", self.isSomethingEnabled.target];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Name: %@",self.isSomethingEnabled.name);
    DBManager *db = [[DBManager alloc]init];
    self.activities = [db getAllActivities];
    Activity *activity = [self.activities objectAtIndex:[self.activityNumber intValue]];
    self.navigationItem.title = activity.name;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"edit"]){
        EditDetails *controller = segue.destinationViewController;
        controller.isSomethingEnabled = self.isSomethingEnabled;
        controller.activityNumber = self.activityNumber;
    }
    
    NSLog (@"it worked");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
