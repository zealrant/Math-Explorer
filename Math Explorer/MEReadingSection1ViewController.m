//
//  MEReadingSection1ViewController.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/14/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "MEReadingSection1ViewController.h"
#import "MEAppDelegate.h"


@implementation MEReadingSection1ViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	[[[self navigationController] navigationBar] setBarStyle:UIBarStyleBlackOpaque];
	[[self navigationController] setNavigationBarHidden:NO animated:NO];
	
	int langCode=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] langCode];
	sqlite3 *dbo=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] dbo];
	sqlite3_stmt *localizer=NULL;
	
	sqlite3_prepare_v2(dbo, [@"SELECT value FROM general_texts WHERE key=:keystring AND lang=:langnum" UTF8String], -1, &localizer, NULL);
	sqlite3_bind_text(localizer, 1, [@"reading.sect1" UTF8String], -1, NULL);
	sqlite3_bind_int(localizer, 2, langCode);
	sqlite3_step(localizer);
	[self setTitle:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)]];
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
	[[self navigationController] setNavigationBarHidden:YES animated:NO];
	
	NSMutableArray *rearranged=[NSMutableArray arrayWithArray:[[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] ctrlBackup] subarrayWithRange:NSMakeRange(0, 2)]];
	[rearranged addObject:self];
	
	[[self navigationController] setViewControllers:rearranged animated:NO];
	[[self navigationController] popToViewController:[rearranged objectAtIndex:1] animated:YES];
}

-(IBAction)prevClicked:(id)sender {
	[[self navigationController] setNavigationBarHidden:YES animated:NO];
	
	NSMutableArray *rearranged=[NSMutableArray arrayWithArray:[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] ctrlBackup]];
	[rearranged addObject:self];
	
	[[self navigationController] setViewControllers:rearranged animated:NO];
	[[self navigationController] popViewControllerAnimated:YES];
}

-(IBAction)nextClicked:(id)sender {
	//
}

@end