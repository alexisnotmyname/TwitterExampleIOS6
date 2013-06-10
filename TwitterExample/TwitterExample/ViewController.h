//
//  ViewController.h
//  TwitterExample
//
//  Created by chocowin on 6/10/13.
//  Copyright (c) 2013 chocowin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)tweetTapped:(id)sender;
- (IBAction)choosePhoto:(id)sender;
@end
