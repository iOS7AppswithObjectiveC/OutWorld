//
//  GMSpaceImageViewController.h
//  Out of this World
//
//  Created by ED on 4/29/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMSpaceObject.h"

@interface GMSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) GMSpaceObject *spaceObject;

@end
