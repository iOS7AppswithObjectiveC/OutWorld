//
//  GMAddSpaceObjectViewController.h
//  Out of this World
//
//  Created by ED on 4/30/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMSpaceObject.h"

@protocol GMAddSpaceObjectViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject:(GMSpaceObject *)spaceObject;;
-(void)didCancel;


@end

@interface GMAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <GMAddSpaceObjectViewControllerDelegate> delegate;


@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestFactTextField;

- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;


@end
