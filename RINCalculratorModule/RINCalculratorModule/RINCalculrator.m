//
//  RINCalculrator.m
//  RINCalculratorModule
//
//  Created by rino0601 on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "RINCalculrator.h"

@implementation RINCalculrator
- (UITextField *)addQuestTextField:(CGRect)bound
{
	UITextField * textFieldRounded = [[UITextField alloc] initWithFrame:CGRectMake(0, 0,RIN_CAL_WIDTH, 31)];
	textFieldRounded.borderStyle = UITextBorderStyleRoundedRect;
	textFieldRounded.textColor = [UIColor blackColor]; //text color
	textFieldRounded.font = [UIFont systemFontOfSize:17.0];  //font size
//	textFieldRounded.placeholder = @"<enter text>";  //place holder
	textFieldRounded.text = @"The Cake is Lie!!"; 		// @ have to read from DB.
	textFieldRounded.backgroundColor = [UIColor whiteColor]; //background color
	textFieldRounded.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
	
	textFieldRounded.keyboardType = UIKeyboardTypeDefault;  // type of the keyboard
	textFieldRounded.returnKeyType = UIReturnKeyDone;  // type of the return key
	
	textFieldRounded.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
	[textFieldRounded setUserInteractionEnabled:NO];
	[textFieldRounded setTag:25];
//	textFieldRounded.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
	return textFieldRounded;

}
- (UIButton *)addButton:(NSString *)title parrentBound:(CGRect)bound Tag:(NSInteger)idTag
{
	UIImage *btBack = [UIImage imageNamed:@"backBt.png"];
	UIImage *btBackDn = [UIImage imageNamed:@"backBtDn.png"];
	CGRect bFrame = CGRectMake(bound.origin.x, bound.origin.y, bound.size.width, bound.size.height);
	
//	UIButton *backBt = [[UIButton alloc] initWithFrame:bFrame];
	
	UIButton *backBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	backBt.frame=bFrame;
	
	backBt.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	backBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	[backBt setTitle:title forState: UIControlStateNormal];
	[backBt setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
	[backBt setBackgroundImage:btBack forState: UIControlStateNormal];
	[backBt setBackgroundImage:btBackDn forState: UIControlStateHighlighted];
	backBt.backgroundColor = [UIColor clearColor];
	[backBt setTag:idTag];
	
//	[backBt addTarget:self action:@selector(ButtonPressed:event:) forControlEvents: UIControlEventTouchUpInside];
	[backBt setUserInteractionEnabled:YES];
	return backBt;
}

- (void) PressNumberKeypad:(id)sender event:(UIEvent *)e
{
	//tag 06,07,
	// 12,13,14,
	// 19,20,21
	//ans 23
	UIButton *SEND = (UIButton *)sender;
	NSString *CTNr;
	if([[(UIButton *)[self viewWithTag:23] titleLabel].text isEqualToString:@"Check"]){
		if ([[(UIButton *)[self viewWithTag:19] titleLabel].text isEqualToString:@" "]) {
			CTNr=[(UIButton *)[self viewWithTag:20] currentTitle];
			[(UIButton *)[self viewWithTag:19] setTitle:CTNr forState:UIControlStateNormal];
			CTNr=[(UIButton *)[self viewWithTag:21] currentTitle];
			[(UIButton *)[self viewWithTag:20] setTitle:CTNr forState:UIControlStateNormal];
			CTNr=[SEND currentTitle];
			[(UIButton *)[self viewWithTag:21] setTitle:CTNr forState:UIControlStateNormal];
		}else {
			return ;
		}
	}else {
		if([[(UIButton *)[self viewWithTag:12] titleLabel].text isEqualToString:@" "]){
			if([[(UIButton *)[self viewWithTag:6] titleLabel].text isEqualToString:@" "]){
				CTNr=[(UIButton *)[self viewWithTag:7] currentTitle];
				[(UIButton *)[self viewWithTag:6] setTitle:CTNr forState:UIControlStateNormal];
				CTNr=[SEND currentTitle];
				[(UIButton *)[self viewWithTag:7] setTitle:CTNr forState:UIControlStateNormal];
			}else {
				return ;
			}
		}else {
			if ([[(UIButton *)[self viewWithTag:13] titleLabel].text isEqualToString:@" "]) {
				CTNr=[(UIButton *)[self viewWithTag:14] currentTitle];
				[(UIButton *)[self viewWithTag:13] setTitle:CTNr forState:UIControlStateNormal];
				CTNr=[SEND currentTitle];
				[(UIButton *)[self viewWithTag:14] setTitle:CTNr forState:UIControlStateNormal];
			}else {
				return ;
			}
		}
	}
	
	
}
- (void) PressClearButton:(id)sender event:(UIEvent *)e
{
	//UIButton *SEND = (UIButton *)sender;
	// tag 6,7,12,13,14,19,20,21
	
	[(UIButton *)[self viewWithTag:6] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:7] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:12] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:13] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:14] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:19] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:20] setTitle:@" " forState:UIControlStateNormal];
	[(UIButton *)[self viewWithTag:21] setTitle:@" " forState:UIControlStateNormal];
	
	[(UIButton *)[self viewWithTag:23] setTitle:@"Answer" forState:UIControlStateNormal];
}
- (void) PressSignButton:(id)sender event:(UIEvent *)e
{
	UIButton *SEND = (UIButton *)sender;
	NSString *Sign;
	Sign=[SEND currentTitle];
	[(UIButton *)[self viewWithTag:12] setTitle:Sign forState:UIControlStateNormal];
}
- (UIButton *)numberKeyMap:(int) num
{
	UIButton *BUTTON;
	switch (num) {
		case 0:
			BUTTON = (UIButton *)[self viewWithTag:22];
			break;
		case 1:
			BUTTON = (UIButton *)[self viewWithTag:15];
			break;
		case 2:
			BUTTON = (UIButton *)[self viewWithTag:16];
			break;
		case 3:
			BUTTON = (UIButton *)[self viewWithTag:17];
			break;
		case 4:
			BUTTON = (UIButton *)[self viewWithTag:8];
			break;
		case 5:
			BUTTON = (UIButton *)[self viewWithTag:9];
			break;
		case 6:
			BUTTON = (UIButton *)[self viewWithTag:10];
			break;
		case 7:
			BUTTON = (UIButton *)[self viewWithTag:1];
			break;
		case 8:
			BUTTON = (UIButton *)[self viewWithTag:2];
			break;
		case 9:
			BUTTON = (UIButton *)[self viewWithTag:3];
			break;
		default:
			break;
	}
	return BUTTON;
}
- (void) diminishButton:(id)sender
{
	[UIView animateWithDuration:0.9 animations:^{
		sleep(1);
		[(UIButton *)sender setTransform:CGAffineTransformMakeScale(1, 1)];
		[(UIButton *)sender setHighlighted:NO];
	}];
}
- (void) inflateButton:(id)sender
{
	UIButton *pressed =sender;
	switch (pressed.tag) {
		case 1: case 2: case 3:
		case 8: case 9: case 10:
		case 15:case 16:case 17:
		case 22:// numberKeypad
			[self PressNumberKeypad:sender event:nil];
			break;
		case 4://clear
			[self PressClearButton:sender event:nil];
			break;
		case 5: //tutorial
			[self PressTutorialButton:sender event:nil];
			break;
		case 11: case 18: //signs
			[self PressSignButton:sender event:nil];
			break;
		case 23: //answer
			[self PressAnswerButton:sender event:nil];
			break;
		case 24: //submit
			[self PressSubmitButton:sender event:nil];
			break;
		default:
			break;
	}
	[UIView animateWithDuration:0.9 animations:^{
		[(UIButton *)sender setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
		[(UIButton *)sender setHighlighted:YES];
		[NSThread detachNewThreadSelector:@selector(diminishButton:) toTarget:self withObject:sender];
	}];	
}
- (void) PressTutorialButton:(id)sender event:(UIEvent *)e
{
//	UIButton *SEND = (UIButton *)sender;
	int row1=nv1, row2=nv2, row3=correct;
	[self PressClearButton:nil event:nil];// why it doesn't work?
	//row1
	if(row1<10){
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row1]];
	}else {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row1/10]];
		sleep(1);
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row1%10]];
	}
	sleep(1);
	//sign proc
	if(row3==row1+row2){
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self viewWithTag:11]];
	}else {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self viewWithTag:18]];
	}
	sleep(1);
	//row2
	if (row2<10) {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row2]];
	}else {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row2/10]];
		sleep(1);
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row2%10]];
	}
	sleep(1);
	//answer proc
	[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self viewWithTag:23]];
	sleep(1);
	//row3
	if (row3<10) {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row3]];
	}else if(row3 <100){
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row3/10]];
		sleep(1);
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row3%10]];
	}else {
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row3/100]];
		sleep(1);
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:(row3/10)%10]];
		sleep(1);
		[NSThread detachNewThreadSelector:@selector(inflateButton:) toTarget:self withObject:[self numberKeyMap:row3%10]];
	}
	sleep(1);
	[self PressClearButton:nil event:nil];
}
- (void) PressSubmitButton:(id)sender event:(UIEvent *)e
{
	UITextField *DEbug;
	UIButton *nv11,*nv12,*nv21,*nv22;
	UIButton *na1,*na2,*na3;
//	UIButton *SEND = (UIButton *)sender;
	bool check[4];

	nv11=(UIButton *)[self viewWithTag:6];
	nv12=(UIButton *)[self viewWithTag:7];
	nv21=(UIButton *)[self viewWithTag:13];
	nv22=(UIButton *)[self viewWithTag:14];
	na1=(UIButton *)[self viewWithTag:19];
	na2=(UIButton *)[self viewWithTag:20];
	na3=(UIButton *)[self viewWithTag:21];
	DEbug=(UITextField *)[self viewWithTag:25];
	check[3] = YES;
	// some variable that meaning type of question from DB = v1
	/*
	 if(v1==1){
	 	if([[(UIButton *)[self viewWithTag:12] titleLabel].text isEqualToString:@"+"]){
	 		check[3]=YES;
	 	}else{
	 		check[3]=NO;
	 	}
	 }else{
	 	if([[(UIButton *)[self viewWithTag:12] titleLabel].text isEqualToString:@"-"]){
	 		check[3]=YES;
		}else{
	 		check[3]=NO;
	 	}
	 }
	 */
	check[0] = nv1==[[nv11 currentTitle] intValue]*10+[[nv12 currentTitle] intValue]*1;
	check[1] = nv2==[[nv21 currentTitle] intValue]*10+[[nv22 currentTitle] intValue]*1;
	check[2] = correct==[[na1 currentTitle] intValue]*100 + [[na2 currentTitle] intValue]*10 + [[na3 currentTitle] intValue]*1;
	if(check[0]&&check[1]&&check[2]&&check[3]){
		DEbug.text=[NSString stringWithFormat:@"your answer is %d , it is correct",[[na1 currentTitle] intValue]*100 + [[na2 currentTitle] intValue]*10 + [[na3 currentTitle] intValue]*1];
	}else {
		DEbug.text=[NSString stringWithFormat:@"your answer is %d , it isn't correct",[[na1 currentTitle] intValue]*100 + [[na2 currentTitle] intValue]*10 + [[na3 currentTitle] intValue]*1];
	}
}
- (void) PressAnswerButton:(id)sender event:(UIEvent *)e
{
	UIButton *SEND = (UIButton *)sender;
	[(UIButton *)[self viewWithTag:SEND.tag] setTitle:@"Check" forState:UIControlStateNormal];
}
- (void) generateQuestion:(int) dbID
{
	// for test. this method uncompleted.
	nv1 = 10;
	nv2 = 30;
	correct = 40;		// some variable that meaning type of question from DB = v1
	((UITextField *)[self viewWithTag:25]).text=[NSString stringWithFormat:@"%d + %d = ?",nv1,nv2];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		//UIView *computer=[[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 512, 271)];
		NSString *titles[]={
			@"7", @"8", @"9", @"C", @"Tutorial", @"##", @"#",
			@"4", @"5", @"6", @"+", @"SIGN", @"##", @"#",
			@"1", @"2", @"3", @"-", @"###", @"##", @"#",
			@"0", @"Answer", @"SUBMIT!!!"
		};
		[self addSubview:[self addQuestTextField:frame]];
		
		CGRect buttonPos = CGRectMake(RIN_GAP_VERTICAL, RIN_GAP_HORIZON+31, RIN_BTN_WIDTH, RIN_BTN_HEIGHT);
		for (int i=0; i<21; i++) {
			[self addSubview:[self addButton:titles[i] parrentBound:buttonPos Tag:i+1]];
			buttonPos.origin.x+=RIN_BTN_WIDTH+RIN_GAP_HORIZON;
			if(i%7==6){
				buttonPos.origin.y+=RIN_BTN_HEIGHT+RIN_GAP_VERTICAL;
				buttonPos.origin.x=RIN_GAP_HORIZON;
			}
		}
		buttonPos.origin.x=2*RIN_GAP_HORIZON+RIN_BTN_WIDTH;
		[self addSubview:[self addButton:titles[21] parrentBound:buttonPos Tag:22]];
		buttonPos.origin.x+=2*RIN_GAP_HORIZON+2*RIN_BTN_WIDTH;
		[self addSubview:[self addButton:titles[22] parrentBound:buttonPos Tag:23]];
		buttonPos.origin.x+=RIN_GAP_HORIZON+RIN_BTN_WIDTH;
		buttonPos.size.width=2*RIN_GAP_HORIZON+3*RIN_BTN_WIDTH;
		[self addSubview:[self addButton:titles[23] parrentBound:buttonPos Tag:24]];
		[self setBackgroundColor:[UIColor orangeColor]];
		for(int i=0;i<24;i++){
			switch (i+1) {
				case 1: case 2: case 3:
				case 8: case 9: case 10:
				case 15:case 16:case 17:
				case 22:// numberKeypad
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressNumberKeypad:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 4://clear
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressClearButton:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 5: //tutorial
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressTutorialButton:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 11: case 18: //signs
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressSignButton:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 23: //answer
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressAnswerButton:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 24: //submit
					[(UIButton *)[self viewWithTag:i+1] addTarget:self action:@selector(PressSubmitButton:event:) forControlEvents:UIControlEventTouchUpInside];
					break;
				case 12:
				default:
					//tag 6,7,
					//12,13,14,
					//19,20,21
					[[self viewWithTag:i+1] setUserInteractionEnabled:NO];
					break;
			}
		}
		[self PressClearButton:self event:nil];
		[self generateQuestion:0];// for test.
    }
	
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
