//
//  METitleViewController.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/6/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface METitleViewController:UIViewController {
	IBOutlet UILabel *meSubtitle, *meTitle;
}

-(IBAction)nextClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;

@end