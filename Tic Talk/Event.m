//
//  Event.m
//  Tic Talk
//
//  Created by Wyatt Smith on 11/5/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import "Event.h"
#import "DBManager.h"


@implementation Event

@dynamic name;
@dynamic startTime;
@dynamic startDate;
@dynamic endDate;
@dynamic endTime;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.db = [[DBManager alloc] init];
    
    self.events = [self.db getAllActivities];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Activity *temp =[self.events objectAtIndex:indexPath.row];
    
    cell.textLabel.text = temp.name;
    
    return cell;
}




@end
