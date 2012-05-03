//
//  MEReadingSection1ViewController.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/14/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MEReadingSection1ViewController:UIViewController {
	IBOutlet UIButton *navHome;
	IBOutlet UILabel *instLabel;
	IBOutlet UITextView *probView;
}

-(IBAction)homeClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;
-(IBAction)nextClicked:(id)sender;

@end