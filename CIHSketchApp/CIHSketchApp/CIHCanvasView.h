//
//  CIHCanvasView.h
//  CIHCanvasView
//
//  Created by Cyrus Hackford on 2/25/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BEZIER_INTERPOLATION_COEFFICIENT ((CGFloat)0.7)
#define LINE_THICKNESS_NORMAL ((CGFloat)7.0)
#define LINE_THICKNESS_THICK ((CGFloat)10.0)
#define LINE_THICKNESS_THIN ((CGFloat)4.0)
#define POINTSTORAGE_CAPACITY ((NSUInteger)1000)


@interface CIHCanvasView:UIView {
@private
	//BOOL doesContextExist;
	BOOL isEnd;
	CGContextRef ctx;
	CGFloat cRed, cGreen, cBlue, cAlpha, wLine;
	CGPoint *points;
	CGRect frameSize;
	NSUInteger pointIndex, alloced;
}

-(void)changeColor:(UIColor *)color;
-(void)changeWidth:(CGFloat)thickness;
-(void)clearView;

-(void)stampImage:(UIImage *)image at:(CGPoint)coord withSize:(CGSize)size;

@end