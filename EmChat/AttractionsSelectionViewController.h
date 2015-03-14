//
//  AttractionsSelectionViewController.h
//  EmChat
//
//  Created by Ashish Awaghad on 14/3/15.
//  Copyright (c) 2015 Alan Wong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface AttractionsSelectionViewController : UIViewController

@property Person* me;
- (IBAction)donePressed:(id)sender;

@end
