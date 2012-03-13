//
//  METitleViewController.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/6/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "METitleViewController.h"
#import "MEAppDelegate.h"
#import "MELearningGoalViewController.h"


@implementation METitleViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	
	int langCode=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] langCode];
	sqlite3 *dbo=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] dbo];
	sqlite3_stmt *localizer=NULL;
	
	sqlite3_prepare_v2(dbo, [@"SELECT value FROM general_texts WHERE key=:keystring AND lang=:langnum" UTF8String], -1, &localizer, NULL);
	sqlite3_bind_text(localizer, 1, [@"me.title" UTF8String], -1, NULL);
	sqlite3_bind_int(localizer, 2, langCode);
	sqlite3_step(localizer);
	[meTitle setText:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)]];
	sqlite3_reset(localizer);
	
	sqlite3_bind_text(localizer, 1, [@"me.subtitle" UTF8String], -1, NULL);
	sqlite3_step(localizer);
	[meSubtitle setText:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)]];
	sqlite3_finalize(localizer);
	
	localizer=NULL;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation==UIInterfaceOrientationLandscapeRight);
}

-(IBAction)nextClicked:(id)sender {
	[[self navigationController] pushViewController:[[MELearningGoalViewController alloc] initWithNibName:@"MELearningGoalViewController" bundle:nil] animated:YES];
}

-(IBAction)prevClicked:(id)sender {
	[[self navigationController] popViewControllerAnimated:YES];
}

@end