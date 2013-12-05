//
//  AddNewBlock.m
//  Tic Talk
//
//  Created by Alex Graziano on 11/12/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "AddNewBlock.h"
#import "DBManager.h"

@interface AddNewBlock ()

@end

@implementation AddNewBlock

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
    //_startDate.transform = CGAffineTransformMakeScale(.7, 0.7);
    //_endDate.transform = CGAffineTransformMakeScale(.7, 0.7);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addBlock:(id)sender {
    DBManager *db = [[DBManager alloc] init];
    NSLog(@"%@", _startDate);
    [db addEvent:self.startDate.date :self.endDate.date :self.isSomethingEnabled];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
