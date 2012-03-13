//
//  MEAppDelegate.m
//  Math Explorer
//
//  Created by Cyrus I. Hackford on 3/6/12.
//  Copyright (c) 2012 SI devIk. All rights reserved.
//

#import "MEAppDelegate.h"
#import "MELanguageSelectionViewController.h"


@implementation MEAppDelegate

@synthesize langCode, dbo;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self checkAndCreateDatabase];
	sqlite3_open_v2([databasePath UTF8String], &dbo, SQLITE_OPEN_READONLY, NULL);
	
	MELanguageSelectionViewController *l=[[MELanguageSelectionViewController alloc] initWithNibName:@"MELanguageSelectionViewController" bundle:nil];
	navController=[[UINavigationController alloc] initWithRootViewController:l];
	[navController setNavigationBarHidden:YES];
	
	mainWindow=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[mainWindow addSubview:[navController view]];
	[mainWindow makeKeyAndVisible];
	
	return YES;
}

-(void)applicationWillTerminate:(UIApplication *)application {
	sqlite3_close(dbo);
}

-(void)checkAndCreateDatabase {
	databasePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DATABASE_NAME];
	
	NSFileManager *fileManager=[NSFileManager defaultManager];
	if([fileManager fileExistsAtPath:databasePath]==YES)
		return;
	[fileManager copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME] toPath:databasePath error:NULL];
}

@end