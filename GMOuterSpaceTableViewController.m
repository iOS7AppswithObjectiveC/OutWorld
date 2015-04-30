//
//  GMOuterSpaceTableViewController.m
//  Out of this World
//
//  Created by ED on 4/28/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "GMOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "GMSpaceObject.h"
#import "GMSpaceImageViewController.h"
#import "GMSpaceDataViewController.h"

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
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        GMSpaceObject *planet = [[GMSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//    [self.planets addObject:planet8];
    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"ocean Color"];
//    [myDictionary setObject:@"yellow" forKey:@"star Color"];
//    NSLog(@"%@", myDictionary);
//    
//    NSString *blueString = [myDictionary objectForKey:@"ocean Color"];
//    NSLog(@"%@", blueString);
    
    
//    NSNumber *myNumber = [NSNumber numberWithInt:5];
//    NSLog(@"%@", myNumber);
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[GMSpaceImageViewController class]])
             {
                 GMSpaceImageViewController *nextViewController = segue.destinationViewController;
                 NSIndexPath *path = [self.tableView indexPathForCell:sender];
                 GMSpaceObject *selectedObject = self.planets[path.row];
                 nextViewController.spaceObject = selectedObject;
             }
    }
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[GMSpaceDataViewController class]])
        {
            GMSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            GMSpaceObject *selectedObject = self.planets[path.row];
            targetViewController.spaceObject = selectedObject;
        }
    }
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
    
    GMSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.spaceImage;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}


#pragma  mark UITableView Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushToSpaceData" sender:indexPath];
}

@end