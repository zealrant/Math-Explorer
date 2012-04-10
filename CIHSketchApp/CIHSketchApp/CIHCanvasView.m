//
//  CIHCanvasView.m
//  CIHCanvasView
//
//  Created by Cyrus Hackford on 2/25/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "CIHCanvasView.h"


static CGFloat dist(CGPoint p1, CGPoint p2) {
	CGFloat dx=p2.x-p1.x, dy=p2.y-p1.y;
	
	return (CGFloat)sqrt((dx*dx)+(dy*dy));
}

static CGPoint mid(CGPoint p1, CGPoint p2) {
	return CGPointMake((p1.x+p2.x)/2.0, (p1.y+p2.y)/2.0);
}

static void interpolateBezierPathAtNode(CGContextRef ctx, CGPoint *points, NSUInteger  *pointCount, BOOL isEnd) {
	if(ctx==NULL)
		return;
	
	NSUInteger currentCount=*pointCount;
	NSUInteger mID=isEnd==NO?currentCount-3:currentCount-2;
	
	CGPoint p1=points[mID-1], p2=points[mID], p3=points[mID+1], p4;
	CGPoint m1=mid(p1, p2), m2=mid(p2, p3), m3;
	CGFloat l1=dist(p1, p2), l2=dist(p2, p3), l3;
	CGPoint o1=CGPointMake((l1*m2.x+l2*m1.x)/(l1+l2), (l1*m2.y+l2*m1.y)/(l1+l2)), o2;
	CGPoint d1=CGPointMake(p2.x-o1.x, p2.y-o1.y), d2;
	CGPoint c1=CGPointMake(m1.x+d1.x, m1.y+d1.y), c2=CGPointMake(m2.x+d1.x, m2.y+d1.y), c3;
	c1.x+=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(p2.x-c1.x);
	c1.y+=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(p2.y-c1.y);
	c2.x-=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(c2.x-p2.x);
	c2.y-=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(c2.y-p2.y);
	
	if(isEnd==NO) {
		p4=points[mID+2];
		m3=mid(p3, p4);
		l3=dist(p3, p4);
		o2=CGPointMake((l2*m3.x+l3*m2.x)/(l2+l3), (l2*m3.y+l3*m2.y)/(l2+l3));
		d2=CGPointMake(p3.x-o2.x, p3.y-o2.y);
		c3=CGPointMake(m2.x+d2.x, m2.y+d2.y);
		c3.x+=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(p3.x-c3.x);
		c3.y-=(1.0-BEZIER_INTERPOLATION_COEFFICIENT)*(c3.y-p3.y);
		
		if(mID==1) {
			CGContextBeginPath(ctx);
			CGContextMoveToPoint(ctx, p1.x, p1.y);
			CGContextAddCurveToPoint(ctx, p1.x, p1.y, c1.x, c1.y, p2.x, p2.y);
			CGContextAddCurveToPoint(ctx, c2.x, c2.y, c3.x, c3.y, p3.x, p3.y);
			CGContextStrokePath(ctx);
		} else {
			CGContextBeginPath(ctx);
			CGContextMoveToPoint(ctx, p2.x, p2.y);
			CGContextAddCurveToPoint(ctx, c2.x, c2.y, c3.x, c3.y, p3.x, p3.y);
			CGContextStrokePath(ctx);
		}
	} else {
		if(mID==1) {
			CGContextBeginPath(ctx);
			CGContextMoveToPoint(ctx, p1.x, p1.y);
			CGContextAddCurveToPoint(ctx, p1.x, p1.y, c1.x, c1.y, p2.x, p2.y);
			CGContextAddCurveToPoint(ctx, c2.x, c2.y, p3.x, p3.y, p3.x, p3.y);
			CGContextStrokePath(ctx);
		} else {
			CGContextBeginPath(ctx);
			CGContextMoveToPoint(ctx, p2.x, p2.y);
			CGContextAddCurveToPoint(ctx, c2.x, c2.y, p3.x, p3.y, p3.x, p3.y);
			CGContextStrokePath(ctx);
		}
		*pointCount=0;
	}
}

@implementation CIHCanvasView

-(id)initWithFrame:(CGRect)frame {
	self=[super initWithFrame:frame];
	if(self) {
		[self setBackgroundColor:[UIColor whiteColor]];
		
		//doesContextExist=NO;
		//ctx=NULL;
		frameSize=frame;
		cRed=cGreen=cBlue=0;
		cAlpha=1;
		wLine=LINE_THICKNESS_NORMAL;
		[self createContextReleasingFirst:NO];
		
		points=(CGPoint *)malloc(sizeof(CGPoint)*(alloced=POINTSTORAGE_CAPACITY));
		if(points==NULL)
			self=nil;
		
		pointIndex=0;
	}
	
	return self;
}

-(void)changeColor:(UIColor *)color {
	CGFloat tRed=0.0, tGreen=0.0, tBlue=0.0, tAlpha=1.0;
	[color getRed:&tRed green:&tGreen blue:&tBlue alpha:&tAlpha];
	cRed=tRed;
	cGreen=tGreen;
	cBlue=tBlue;
	cAlpha=tAlpha;
	
	CGContextSetRGBStrokeColor(ctx, cRed, cGreen, cBlue, cAlpha);
}

-(void)changeWidth:(CGFloat)thickness {
	wLine=thickness;
	
	CGContextSetLineWidth(ctx, wLine);
}

-(void)clearView {
	[self createContextReleasingFirst:YES];
	[self setNeedsDisplay];
}

-(void)createContextReleasingFirst:(BOOL)shouldReleaseFirst {
	if(shouldReleaseFirst==YES)
		CGContextRelease(ctx);
	
	CGColorSpaceRef cs=CGColorSpaceCreateDeviceRGB();
	ctx=CGBitmapContextCreate(NULL, frameSize.size.width, frameSize.size.height, 8, 4*frameSize.size.width, cs, kCGImageAlphaPremultipliedFirst);
	CGColorSpaceRelease(cs);
	CGContextSetLineWidth(ctx, wLine);
	CGContextSetLineCap(ctx, kCGLineCapRound);
	CGContextSetRGBStrokeColor(ctx, cRed, cGreen, cBlue, cAlpha);
}

-(void)dealloc {
	alloced=pointIndex=0;
	free(points);
	points=NULL;
	//if(doesContextExist==YES)
	CGContextRelease(ctx);
	ctx=NULL;
	
	//[super dealloc];
}

-(void)drawRect:(CGRect)rect {
	/*
	 if(doesContextExist==NO) {
	 ctx=UIGraphicsGetCurrentContext();
	 CGContextRetain(ctx);
	 CGContextSetLineWidth(ctx, LINE_THICKNESS);
	 CGContextSetLineCap(ctx, kCGLineCapRound);
	 CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
	 
	 doesContextExist=YES;
	 }
	 
	 //CGContextFlush(ctx);
	 //CGContextSynchronize(ctx);
	 //*/
	
	//*
	CGImageRef i=CGBitmapContextCreateImage(ctx);
	CGContextDrawImage(UIGraphicsGetCurrentContext(), [self bounds], i);
	CGImageRelease(i);
	//*/
}

-(void)stampImage:(UIImage *)image at:(CGPoint)coord withSize:(CGSize)size {
	//UIImage *flippedImage=[UIImage imageWithCGImage:[image CGImage] scale:1.0 orientation:UIImageOrientationUpMirrored];
	//CGImageRef img=CGImageRotatedByAngle([flippedImage CGImage], 180);
	//CGImageRef img=[flippedImage CGImage];
	CGContextSaveGState(ctx);
	CGContextTranslateCTM(ctx, 0, size.height);
	CGContextScaleCTM(ctx, 1.0, -1.0);
	CGContextDrawImage(ctx, CGRectMake(coord.x, -coord.y, size.width, size.height), [image CGImage]);
	CGContextRestoreGState(ctx);
	//[image drawInRect:CGRectMake(coord.x, coord.y, size.width, size.height)];
	[self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	isEnd=NO;
	points[pointIndex++]=[[touches anyObject] locationInView:self];
	//NSLog(@"1");
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//if(doesContextExist==NO)
	//	return;
	isEnd=YES;
	
	//*
	if(pointIndex==1) {
		CGPoint touch=[[touches anyObject] locationInView:self];
		CGContextFillEllipseInRect(ctx, CGRectMake(touch.x, touch.y, wLine, wLine));
		pointIndex=0;
	} else if(pointIndex==2) {
		CGContextBeginPath(ctx);
		CGContextMoveToPoint(ctx, points[0].x, points[0].y);
		CGContextAddLineToPoint(ctx, points[1].x, points[1].y);
		CGContextStrokePath(ctx);
		pointIndex=0;
	} else if(pointIndex>=3)
		interpolateBezierPathAtNode(ctx, points, &pointIndex, YES);
	//*/
	[self setNeedsDisplay];
	//NSLog(@"3");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	points[pointIndex++]=[[touches anyObject] locationInView:self];
	
	if(pointIndex==alloced)
		points=(CGPoint *)realloc(points, (alloced+=POINTSTORAGE_CAPACITY));
	
	if(pointIndex>3) {
		interpolateBezierPathAtNode(ctx, points, &pointIndex, NO);
		
		[self setNeedsDisplay];
	}
	//NSLog(@"2");
}

@end