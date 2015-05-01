//
//  GMAddSpaceObjectViewController.m
//  Out of this World
//
//  Created by ED on 4/30/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "GMAddSpaceObjectViewController.h"


@interface GMAddSpaceObjectViewController ()

@end

@implementation GMAddSpaceObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)cancelButton:(UIButton *)sender
{
    
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender
{
    GMSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    
    [self.delegate addSpaceObject:newSpaceObject];
}

- (GMSpaceObject *)returnNewSpaceObject
{
    GMSpaceObject *addedSpaceObject = [[GMSpaceObject alloc] init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text floatValue];
    addedSpaceObject.numberOfMoons = [self.numberOfMoonsTextField.text intValue];
    addedSpaceObject.interestFact = self.interestFactTextField.text;
    
    addedSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return addedSpaceObject;
    
}
@end
