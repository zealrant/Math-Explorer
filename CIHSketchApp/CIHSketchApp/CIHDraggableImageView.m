//
//  CIHDraggableImageView.m
//  CIHSketchApp
//
//  Created by Cyrus Hackford on 3/1/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "CIHDraggableImageView.h"

@implementation CIHDraggableImageView

//@synthesize delegate=_myDelegate;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	handleDiffFromOrigin=[[touches anyObject] locationInView:self];
	
	copycat=[[UIImageView alloc] initWithFrame:[self bounds]];
	[copycat setImage:[self image]];
	[[[UIApplication sharedApplication] keyWindow] addSubview:copycat];
	
	CGPoint locationInWindow=[[touches anyObject] locationInView:[[UIApplication sharedApplication] keyWindow]];
	[copycat setCenter:CGPointMake(locationInWindow.x-handleDiffFromOrigin.x+([copycat bounds].size.width/2), locationInWindow.y-handleDiffFromOrigin.y+([copycat bounds].size.height/2))];
	//[copycat setCenter:CGPointMake(locationInWindow.x+([copycat bounds].size.width/2), locationInWindow.y+([copycat bounds].size.height/2))];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//*
	CGPoint locationInWindow=[[touches anyObject] locationInView:[[UIApplication sharedApplication] keyWindow]];
	
	if([delegate respondsToSelector:@selector(draggableImageView:dragFinishedOnKeyWindowAt:)]==YES)
		[delegate draggableImageView:self dragFinishedOnKeyWindowAt:CGPointMake(locationInWindow.x-handleDiffFromOrigin.x-5, locationInWindow.y-handleDiffFromOrigin.y-25)];
	//*/
	
	[copycat removeFromSuperview];
	copycat=nil;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint locationInWindow=[[touches anyObject] locationInView:[[UIApplication sharedApplication] keyWindow]];
	[copycat setCenter:CGPointMake(locationInWindow.x-handleDiffFromOrigin.x+([copycat bounds].size.width/2), locationInWindow.y-handleDiffFromOrigin.y+([copycat bounds].size.height/2))];
	//[copycat setCenter:CGPointMake(locationInWindow.x+([copycat bounds].size.width/2), locationInWindow.y+([copycat bounds].size.height/2))];
}

@end