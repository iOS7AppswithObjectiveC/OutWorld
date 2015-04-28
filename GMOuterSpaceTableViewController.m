//
//  GMOuterSpaceTableViewController.m
//  Out of this World
//
//  Created by ED on 4/28/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "GMOuterSpaceTableViewController.h"

@interface GMOuterSpaceTableViewController ()

@end

@implementation GMOuterSpaceTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else {
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];
    
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}


@end