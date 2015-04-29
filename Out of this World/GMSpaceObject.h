//
//  GMSpaceObject.h
//  Out of this World
//
//  Created by ED on 4/29/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

@property (strong, nonatomic) UIImage *spaceImage;


-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
