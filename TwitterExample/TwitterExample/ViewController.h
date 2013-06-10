//
//  ViewController.h
//  TwitterExample
//
//  Created by chocowin on 6/10/13.
//  Copyright (c) 2013 chocowin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "MBProgressHUD.h"

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)tweetTapped:(id)sender;
- (IBAction)tweetTappediOS6:(id)sender;
- (IBAction)choosePhoto:(id)sender;
@end
