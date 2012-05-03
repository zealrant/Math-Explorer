//
//  MELanguageSelectionViewController.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/6/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "MELanguageSelectionViewController.h"
#import "MEAppDelegate.h"
#import "METitleViewController.h"


@implementation MELanguageSelectionViewController

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation==UIInterfaceOrientationLandscapeRight);
}

-(IBAction)languageSelected:(id)sender {
	MEAppDelegate *d=(MEAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	switch([sender tag]) {
		case 1:
			[d setLangCode:1];
			break;
		case 2:
		default:
			[d setLangCode:2];
			break;
	}
	
	[[self navigationController] pushViewController:[[METitleViewController alloc] initWithNibName:@"METitleViewController" bundle:nil] animated:YES];
}

@end