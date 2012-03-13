//
//  MEReadingIntroViewController.h
//  Math Explorer
//
//  Created by Cyrus Hackford on 3/14/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MEReadingIntroViewController:UIViewController {
	IBOutlet UIButton *navHome;
	IBOutlet UILabel *readingIntro;
}

-(IBAction)homeClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;
-(IBAction)nextClicked:(id)sender;

@end