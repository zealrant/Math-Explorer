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


@interface MEAppDelegate:UIResponder <UIApplicationDelegate> {
@private
	NSArray *ctrlBackup;
	NSString *databasePath;
	sqlite3 *dbo;
	UINavigationController *navController;
	UIWindow *mainWindow;
}

@property(strong, nonatomic) NSArray *ctrlBackup;
@property(nonatomic) NSUInteger langCode;
@property(nonatomic, readonly) sqlite3 *dbo;

@end