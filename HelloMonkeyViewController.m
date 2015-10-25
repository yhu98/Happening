//
//  HelloMonkeyViewController.m
//  Happening
//
//  Created by Yupin Hu on 10/25/15.
//  Copyright © 2015 TeamAwesomeHackingEDU. All rights reserved.
//

#import "HelloMonkeyViewController.h"
#import "TwilioClient.h"

@interface HelloMonkeyViewController()
{

    TCDevice* _phone;
    TCConnection* _connection;
}
@end



@implementation HelloMonkeyViewController

- (void)viewDidLoad
{
  //  self.numberField.delegate = self;
    
#if TARGET_IPHONE_SIMULATOR
    NSString *name = @"tommy";
#else
    NSString *name = @"jenny";
#endif
    
#warning replace this URL with your own server
    //check out https://github.com/twilio/mobile-quickstart to get a server up quickly
    NSString *urlString = [NSString stringWithFormat:@"https://happening.herokuapp.com/token?client=%@", name];
    
    //NSString *urlString = @"https://happening.herokuapp.com/token?client=newuser";
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (token == nil) {
        NSLog(@"Error retrieving token: %@", [error localizedDescription]);
    } else {
        _phone = [[TCDevice alloc] initWithCapabilityToken:token delegate:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dialButtonPressed:(id)sender
{
    [self.numberField resignFirstResponder];
    NSDictionary *params = @{@"To": self.numberField.text};
    _connection = [_phone connect:params delegate:nil];
    
    //_connection = [_phone connect:nil delegate:nil];
}

- (IBAction)hangupButtonPressed:(id)sender
{
    [_connection disconnect];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
