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
    
    self.planets = [[NSMutableArray alloc] init];
    
    NSString *planet1 = @"Mercury";
    NSString *planet2 = @"Venus";
    NSString *planet3 = @"Earth";
    NSString *planet4 = @"Mars";
    NSString *planet5 = @"Jupitor";
    NSString *planet6 = @"Saturn";
    NSString *planet7 = @"Uranus";
    NSString *planet8 = @"Neptune";
    
    [self.planets addObject:planet1];
    [self.planets addObject:planet2];
    [self.planets addObject:planet3];
    [self.planets addObject:planet4];
    [self.planets addObject:planet5];
    [self.planets addObject:planet6];
    [self.planets addObject:planet7];
    [self.planets addObject:planet8];
    
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
    NSString *firstColor = @"red";
    [myDictionary setObject:firstColor forKey:@"firetruck color"];
    [myDictionary setObject:@"blue" forKey:@"ocean Color"];
    [myDictionary setObject:@"yellow" forKey:@"star Color"];
    NSLog(@"%@", myDictionary);
    
    NSString *blueString = [myDictionary objectForKey:@"ocean Color"];
    NSLog(@"%@", blueString);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.planets count];
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}


@end