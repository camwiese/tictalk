//
//  AddNewActivity.m
//  Tic Talk
//
//  Created by Cameron Wiese on 11/21/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "AddNewActivity.h"
#import "DBManager.h"


@interface AddNewActivity ()

@property (weak, nonatomic) IBOutlet UITextField *targetNum;
@property (weak, nonatomic) IBOutlet UITextField *activityName;

@end

@implementation AddNewActivity

- (IBAction)nameEntry:(UITextField*)sender {
    self.title = sender.text;
}
- (IBAction)targetNumber:(UITextField*)sender {
    NSString *targetNumber = [NSString stringWithFormat:@"", sender.text];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityName.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    
    DBManager *db = [[DBManager alloc]init];
    
    [db addActivity: self.activityName.text : [NSNumber numberWithInt:[self.targetNum.text intValue]] :0];
    [db saveData];
    
    [[self navigationController] popViewControllerAnimated:YES];
}
@end
