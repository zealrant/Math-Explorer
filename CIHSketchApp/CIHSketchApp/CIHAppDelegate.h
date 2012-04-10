//
//  CIHAppDelegate.h
//  CIHSketchApp
//
//  Created by Cyrus Hackford on 3/1/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "CIHDraggableImageView.h"
#import <UIKit/UIKit.h>


@class CIHCanvasView;

@interface CIHAppDelegate:UIResponder <UIApplicationDelegate, CIHDraggableImageViewDelegate> {
	IBOutlet UIView *sketchFrame;
	IBOutlet UIWindow *window;
	CIHCanvasView *sketchView;
}

-(IBAction)clearSketchView:(id)sender;
-(IBAction)lineColorChanged:(id)sender;
-(IBAction)lineWidthChanged:(id)sender;

@end