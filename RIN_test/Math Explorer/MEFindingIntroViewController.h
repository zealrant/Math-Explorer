//
//  MEFindingIntroViewController.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/30/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MEFindingIntroViewController:UIViewController {
@private
	IBOutlet UIButton *navHome;
	IBOutlet UILabel *findingIntro;
}

-(IBAction)homeClicked:(id)sender;
-(IBAction)prevClicked:(id)sender;
-(IBAction)nextClicked:(id)sender;

@end