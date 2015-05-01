//
//  GMOuterSpaceTableViewController.h
//  Out of this World
//
//  Created by ED on 4/28/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMAddSpaceObjectViewController.h"

@interface GMOuterSpaceTableViewController : UITableViewController <GMAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;
@end
