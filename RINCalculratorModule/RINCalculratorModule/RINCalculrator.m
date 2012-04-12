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
- (void) PressTutorialButton:(id)sender event:(UIEvent *)e
{
	UIButton *SEND = (UIButton *)sender;
}
- (void) PressSubmitButton:(id)sender event:(UIEvent *)e
{
	UIButton *SEND = (UIButton *)sender;
}
- (void) PressAnswerButton:(id)sender event:(UIEvent *)e
{
	UIButton *SEND = (UIButton *)sender;
	[(UIButton *)[self viewWithTag:SEND.tag] setTitle:@"Check" forState:UIControlStateNormal];
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
		[self addSubview:[self addButton:titles[21] parrentBound:buttonPos Tag:20]];
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
