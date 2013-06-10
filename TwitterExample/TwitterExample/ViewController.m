//
//  ViewController.m
//  TwitterExample
//
//  Created by chocowin on 6/10/13.
//  Copyright (c) 2013 chocowin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tweetTapped:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Tweeting from my own app! :)"];
        
        if(imageView.image){
            [tweetSheet addImage:imageView.image];
        }
        else
            NSLog(@"wala");
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
        
        tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                    //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResultCancelled:
                    break;
                    //  This means the user hit 'Send'
                case SLComposeViewControllerResultDone:
                    [[[UIAlertView alloc] initWithTitle:@"Result"
                                                message:@"Posted Successfully."
                                               delegate:self
                                      cancelButtonTitle:@"OK!"
                                      otherButtonTitles:nil] show];
                    break;
            }
            
            //  dismiss the Tweet Sheet
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:^{
                    NSLog(@"Tweet Sheet has been dismissed.");
                }];
            });
        };
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (IBAction)choosePhoto:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    //    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion: nil];
}

#pragma mark -ImagePicker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

@end

