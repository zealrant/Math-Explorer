//
//  MEAppDelegate.h
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/6/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

#define DATABASE_NAME @"MEDatabase.sqlite3"
#define JScript_NAME @"important.js"


@interface MEAppDelegate:UIResponder <UIApplicationDelegate> {
@private
	NSString *databasePath;
	NSString *jsciptPath;
	sqlite3 *dbo;
	UINavigationController *navController;
	UIWindow *mainWindow;
}

@property(strong, nonatomic) NSMutableArray *crucialBackup;
@property(nonatomic) NSUInteger langCode;
@property(nonatomic, readonly) sqlite3 *dbo;

@end