//
//  MEFindingSection1ViewController.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 4/4/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "MEFindingSection1ViewController.h"
#import "MEAppDelegate.h"


@implementation MEFindingSection1ViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	[[[self navigationController] navigationBar] setBarStyle:UIBarStyleBlackOpaque];
	[[self navigationController] setNavigationBarHidden:NO];
	
	int langCode=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] langCode];
	sqlite3 *dbo=[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] dbo];
	sqlite3_stmt *localizer=NULL;
	
	sqlite3_prepare_v2(dbo, [@"SELECT value FROM general_texts WHERE key=:keystring AND lang=:langnum" UTF8String], -1, &localizer, NULL);
	sqlite3_bind_text(localizer, 1, [@"finding.sect1" UTF8String], -1, NULL);
	sqlite3_bind_int(localizer, 2, langCode);
	sqlite3_step(localizer);
	[self setTitle:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)]];
	sqlite3_reset(localizer);
	
	sqlite3_bind_text(localizer, 1, [@"nav.home" UTF8String], -1, NULL);
	sqlite3_step(localizer);
	[navHome setTitle:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)] forState:UIControlStateNormal];
	sqlite3_finalize(localizer);
	
	sqlite3_prepare_v2(dbo, [@"SELECT problems.problem, noun_variables.sv1, noun_variables.sv2, noun_variables.ov1, noun_variables.ov2, num_variables.nv1, num_variables.nv2 FROM problems, noun_variables, num_variables, prob_var_map WHERE problems.id=prob_var_map.prob AND noun_variables.id=prob_var_map.noun_var AND num_variables.id=prob_var_map.num_var AND prob_var_map.lang=:langnum AND prob_var_map.id=:probnum" UTF8String], -1, &localizer, NULL);
	sqlite3_bind_int(localizer, 1, langCode);
	sqlite3_bind_int(localizer, 2, [(MEAppDelegate *)[[UIApplication sharedApplication] delegate] problemID]);
	sqlite3_step(localizer);
	const char *sv1=(const char *)sqlite3_column_text(localizer, 1), *sv2=(const char *)sqlite3_column_text(localizer, 2), *ov1=(const char *)sqlite3_column_text(localizer, 3), *ov2=(const char *)sqlite3_column_text(localizer, 4);
	char emptstr[1]={0};
	NSString *problem=[NSString stringWithFormat:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(localizer, 0)], sv1==NULL?emptstr:sv1, sv2==NULL?emptstr:sv2, ov1==NULL?emptstr:ov1, ov2==NULL?emptstr:ov2, sqlite3_column_int(localizer, 5), sqlite3_column_int(localizer, 6)];
	sqlite3_finalize(localizer);
	
	localizer=NULL;
	/*
	NSMutableArray *importants=[NSMutableArray array];
	// load importants
	NSUInteger importantID=1;
	for(NSString *important in importants)
		problem=[problem stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@" %@ ", important] withString:[NSString stringWithFormat:@" <span class=\"imp_%1$u\" onclick=\"highlightImportant(%1$u);\">%2$@</span> ", importantID, important] options:NSCaseInsensitiveSearch range:NSMakeRange(0, [problem length])];
	[clickCheck loadHTMLString:@"asdf" baseURL:nil];
	//*/
	[[clickCheck scrollView] setScrollEnabled:NO];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation==UIInterfaceOrientationLandscapeRight);
}

-(IBAction)homeClicked:(id)sender {
	[[self navigationController] setNavigationBarHidden:YES];
	
	NSMutableArray *rearranged=[NSMutableArray arrayWithArray:[[[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] crucialBackup] objectAtIndex:0] subarrayWithRange:NSMakeRange(0, 2)]];
	[rearranged addObject:self];
	
	[[self navigationController] setViewControllers:rearranged];
	[[self navigationController] popViewControllerAnimated:YES];
}

-(IBAction)prevClicked:(id)sender {
	[[self navigationController] setNavigationBarHidden:YES];
	
	NSMutableArray *rearranged=[NSMutableArray arrayWithArray:[[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] crucialBackup] lastObject]];
	[[(MEAppDelegate *)[[UIApplication sharedApplication] delegate] crucialBackup] removeLastObject];
	[rearranged addObject:self];
	
	[[self navigationController] setViewControllers:rearranged animated:NO];
	[[self navigationController] popViewControllerAnimated:YES];
}

-(IBAction)nextClicked:(id)sender {
	//
}

@end