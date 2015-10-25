//
//  HelloMonkeyViewController.h
//  Happening
//
//  Created by Yupin Hu on 10/25/15.
//  Copyright © 2015 TeamAwesomeHackingEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloMonkeyViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField *numberField;

- (IBAction)dialButtonPressed:(id)sender;
- (IBAction)hangupButtonPressed:(id)sender;
@end
