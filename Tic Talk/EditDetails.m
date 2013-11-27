//
//  EditDetails.m
//  Tic Talk
//
//  Created by Matthew Davis on 10/29/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "EditDetails.h"
#import "DBManager.h"

@interface EditDetails ()
@property (weak, nonatomic) IBOutlet UITextField *targetNum;
@property (weak, nonatomic) IBOutlet UITextField *activityName;

@end

@implementation EditDetails


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


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.item == 1) {
        [cell setBackgroundColor:[UIColor blackColor]];
    } else if (indexPath.item == 2) {
        [cell setBackgroundColor:[UIColor greenColor]];
    } else if (indexPath.item == 3) {
        [cell setBackgroundColor:[UIColor redColor]];
    } else if (indexPath.item == 4) {
        [cell setBackgroundColor:[UIColor orangeColor]];
    } else if (indexPath.item == 5) {
        [cell setBackgroundColor:[UIColor lightGrayColor]];
    } else if (indexPath.item == 6) {
        [cell setBackgroundColor:[UIColor blueColor]];
    } else if (indexPath.item == 7) {
        [cell setBackgroundColor:[UIColor brownColor]];
    } else if (indexPath.item == 8) {
        [cell setBackgroundColor:[UIColor purpleColor]];
    } else if (indexPath.item == 9) {
        [cell setBackgroundColor:[UIColor yellowColor]];
    }
    return cell;
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
    [db addActivity: self.activityName.text : [NSNumber numberWithInt:[self.targetNum.text integerValue]] :0];
    [db saveData];
    [[self navigationController] popViewControllerAnimated:YES];
}
@end
