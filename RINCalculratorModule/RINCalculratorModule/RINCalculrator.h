//
//  RINCalculrator.h
//  RINCalculratorModule
//
//  Created by rino0601 on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RIN_CAL_WIDTH		512
#define RIN_CAL_HEIGHT		271
#define RIN_GAP_VERTICAL	7
#define RIN_GAP_HORIZON	5
#define RIN_BTN_WIDTH		65
#define RIN_BTN_HEIGHT		50

@interface RINCalculrator : UIView
{
	int nv1,nv2;
	int correct;
	bool isStudentSolveQuestion;
}
- (void) generateQuestion:(int) dbID;
@end
