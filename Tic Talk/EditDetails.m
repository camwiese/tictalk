//
//  EditDetails.m
//  Tic Talk
//
//  Created by Matthew Davis on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//
#import "EditDetails.h"
#import "DBManager.h"
#import "DetailsActivities.h"
#import "Activity.h"

@interface EditDetails ()

@property NSArray *activities;
@property DBManager *db;
@property (weak, nonatomic) IBOutlet UITextField *targetNum;
@property (weak, nonatomic) IBOutlet UITextField *activityName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * target;



@end

@implementation EditDetails

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.activityName.delegate = self;
    
	// Do any additional setup after loading the view.
    /*DBManager *db = [[DBManager alloc]init];
     NSManagedObjectContext *context = [db managedObjectContext];
     NSFetchRequest *request = [[NSFetchRequest alloc] init];
     [request setEntity:[NSEntityDescription entityForName:@"Activity" inManagedObjectContext:context]];
     NSLog(@"SUCCESS!!!! - Request Succeeded");
     NSError *errorFetch = nil;
     NSArray *results = [context executeFetchRequest:request error:&errorFetch];*/
    
    Activity *activity = self.isSomethingEnabled;
    self.name = activity.name;
    self.target = activity.target;
    
    self.activityName.text = self.name;
    self.targetNum.text = [NSString stringWithFormat:@"%@",self.target];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", self.name];
    NSLog(@"name == %@", self.isSomethingEnabled.name);
    
    self.navigationItem.title =[self.isSomethingEnabled valueForKey:@"name"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nameEntry:(UITextField*)sender {
    
    self.title = sender.text;
}
- (IBAction)targetNumber:(UITextField*)sender {
    //NSString *targetNumber = sender.text;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_targetNum resignFirstResponder];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"clicked item %d", indexPath.item);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_activityName resignFirstResponder];
    return NO;
}


- (IBAction)save:(id)sender {
    DBManager *db = [[DBManager alloc]init];
    NSLog(@"Number:%@",self.activityNumber);
    [db updateActivity:self.activityName.text:[NSNumber numberWithInt:[self.targetNum.text intValue]]:0:self.activityNumber];
    [db saveData];
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
