//
//  MEReadingIntroViewController.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/14/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "MEReadingIntroViewController.h"
#import "MEAppDelegate.h"
#import "MEReadingSection1ViewController.h"


@implementation MEReadingIntroViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	
	int langCode=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] langCode];
	sqlite3 *dbo=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] dbo];
	sqlite3_stmt *localizer=NULL;
	
	sqlite3_prepare_v2(dbo, [@"SELECT value FROM general_texts WHERE key=:keystring AND lang=:langnum" UTF8String], -1, &localizer, NULL);
	sqlite3_bind_text(localizer, 1, [@"reading.intro" UTF8String], -1, NULL);
	sqlite3_bind_int(localizer, 2, langCode);
	sqlite3_step(localizer);
	[readingIntro setText:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)]];
	sqlite3_reset(localizer);
	
	sqlite3_bind_text(localizer, 1, [@"nav.home" UTF8String], -1, NULL);
	sqlite3_step(localizer);
	[navHome setTitle:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)] forState:UIControlStateNormal];
	sqlite3_finalize(localizer);
	
	localizer=NULL;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation==UIInterfaceOrientationLandscapeRight);
}

-(IBAction)homeClicked:(id)sender {
	[[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:1] animated:YES];
}

-(IBAction)prevClicked:(id)sender {
	[[self navigationController] popViewControllerAnimated:YES];
}

-(IBAction)nextClicked:(id)sender {
	[[self navigationController] setNavigationBarHidden:YES];
	
	[[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] crucialBackup] addObject:[[self navigationController] viewControllers]];
	[[self navigationController] setViewControllers:[NSArray arrayWithObject:[[MEReadingSection1ViewController alloc] initWithNibName:@"MEReadingSection1ViewController" bundle:nil]] animated:YES];
}

@end