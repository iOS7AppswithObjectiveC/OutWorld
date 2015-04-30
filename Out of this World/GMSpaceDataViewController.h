//
//  GMSpaceDataViewController.h
//  Out of this World
//
//  Created by ED on 4/30/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMSpaceObject.h"

@interface GMSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) GMSpaceObject *spaceObject;

@end
