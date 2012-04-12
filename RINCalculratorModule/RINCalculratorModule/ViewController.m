//
//  ViewController.m
//  RINCalculratorModule
//
//  Created by rino0601 on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RINCalculrator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[self view] addSubview:[[RINCalculrator alloc]initWithFrame:CGRectMake(10, 10, RIN_CAL_WIDTH, RIN_CAL_HEIGHT)]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
