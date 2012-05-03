//
//  MEFindingSection1ViewController.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 4/4/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MEFindingSection1ViewController:UIViewController {
@private
	IBOutlet UIButton *navHome;
	IBOutlet UILabel *instLabel;
	IBOutlet UIWebView *clickCheck;
}

-(IBAction)homeClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;
-(IBAction)nextClicked:(id)sender;

@end