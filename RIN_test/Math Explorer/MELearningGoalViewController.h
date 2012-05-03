//
//  MELearningGoalViewController.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/7/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface MELearningGoalViewController:UIViewController {
	IBOutlet UIButton *navHome;
	IBOutlet UILabel *goalTitle;
	IBOutlet UIWebView *goalDetail;
}

-(IBAction)homeClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;
-(IBAction)nextClicked:(id)sender;

@end