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

#define ADDED_SPACE_OBJECTS_KEY @"Added Space Objects Array"

#pragma mark - Lazy Instantiation

-(NSMutableArray *)planets
{
    if (!_planets){
        _planets = [[NSMutableArray alloc] init];
        
    }
    
    return _planets;
}

-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects){
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    
    return _addedSpaceObjects;
}

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
    
    
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
    
    
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        GMSpaceObject *planet = [[GMSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY];
    
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists){
        GMSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
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
                 GMSpaceObject *selectedObject;
                 
                 if (path.section == 0){
                     selectedObject = self.planets[path.row];
                 }
                 else if (path.section == 1){
                     selectedObject = self.addedSpaceObjects[path.row];
                 }
                 
                 
                 nextViewController.spaceObject = selectedObject;
             }
    }
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[GMSpaceDataViewController class]])
        {
            GMSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            GMSpaceObject *selectedObject;
            
            if (path.section == 0){
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            targetViewController.spaceObject = selectedObject;
        }
    }
    if ([segue.destinationViewController isKindOfClass:[GMAddSpaceObjectViewController class]])
    {
        GMAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - GMAddSpaceObjectsViewController Delegate

-(void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)addSpaceObject:(GMSpaceObject *)spaceObject
{
    [self.addedSpaceObjects addObject:spaceObject];
    
    // Will save to NSUserDefaults here
    
    NSMutableArray *spaceObjectsAsPropertieyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY] mutableCopy];
    
    if(!spaceObjectsAsPropertieyLists) spaceObjectsAsPropertieyLists =
        [[NSMutableArray alloc] init];
    
    [spaceObjectsAsPropertieyLists addObject:[self spaceObjectAsPropertyList:spaceObject]];
    
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertieyLists forKey:ADDED_SPACE_OBJECTS_KEY];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Helper Methods

-(NSDictionary *)spaceObjectAsPropertyList:(GMSpaceObject *)spaceObject
{
    
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name,
                                 PLANET_GRAVITY : @(spaceObject.gravitationalForce),
                                 PLANET_DIAMETER : @(spaceObject.diameter),
                                 PLANET_YEAR_LENGTH : @(spaceObject.yearLength),
                                 PLANET_DAY_LENGTH : @(spaceObject.dayLength),
                                 PLANET_TEMPERATURE : @(spaceObject.temperature),
                                 PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons),
                                 PLANET_NICKNAME : spaceObject.nickname,
                                 PLANET_INTERESTING_FACT : spaceObject.interestFact,
                                 PLANET_IMAGE : imageData};
    
    return dictionary;
                                 
}


-(GMSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    GMSpaceObject *spaceObject = [[GMSpaceObject alloc] initWithData:dictionary andImage:spaceObjectImage];
    return spaceObject;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    // added space objects
    if ([self.addedSpaceObjects count]){
        return 2;
    }
    else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 1) {
        return [self.addedSpaceObjects count];
    }
    else {
        return [self.planets count];
    }
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        //Use new Space object to customize our cell
        GMSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
        
    }
    else {
    
        GMSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    
    }
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1){
        return YES;
    }
    else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc] init];
        
        for (GMSpaceObject *spaceObject in self.addedSpaceObjects){
            [newSavedSpaceObjectData addObject:[self spaceObjectAsPropertyList:spaceObject]];
            
        }
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjectData forKey:ADDED_SPACE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

@end