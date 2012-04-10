//
//  CIHAppDelegate.m
//  CIHSketchApp
//
//  Created by Cyrus Hackford on 3/1/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "CIHAppDelegate.h"
#import "CIHCanvasView.h"


@implementation CIHAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	sketchView=[[CIHCanvasView alloc] initWithFrame:CGRectInset([sketchFrame bounds], 5, 5)];
	[sketchFrame addSubview:sketchView];
	[window makeKeyAndVisible];
	
	return YES;
}

-(IBAction)clearSketchView:(id)sender {
	[sketchView clearView];
}

-(IBAction)lineColorChanged:(id)sender {
	switch([sender selectedSegmentIndex]) {
		case 0:
		default:
			[sketchView changeColor:[UIColor blackColor]];
			break;
		case 1:
			[sketchView changeColor:[UIColor redColor]];
			break;
		case 2:
			[sketchView changeColor:[UIColor blueColor]];
			break;
	}
}

-(IBAction)lineWidthChanged:(id)sender {
	switch([sender selectedSegmentIndex]) {
		case 0:
		default:
			[sketchView changeWidth:LINE_THICKNESS_THICK];
			break;
		case 1:
			[sketchView changeWidth:LINE_THICKNESS_NORMAL];
			break;
		case 2:
			[sketchView changeWidth:LINE_THICKNESS_THIN];
			break;
	}
}

-(void)draggableImageView:(CIHDraggableImageView *)view dragFinishedOnKeyWindowAt:(CGPoint)groundZero {
	[sketchView stampImage:[view image] at:groundZero withSize:[view bounds].size];
}

@end