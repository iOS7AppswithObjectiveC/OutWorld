//
//  GMSpaceObject.m
//  Out of this World
//
//  Created by ED on 4/29/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "GMSpaceObject.h"
#import "AstronomicalData.h"

@implementation GMSpaceObject


-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] floatValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
    
    
}
@end
