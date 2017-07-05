//
//  AppDelegate.m
//  WindowTabsMenu
//
//  Created by Richard Markiewicz on 2017-07-04.
//  Copyright © 2017 Richard Markiewicz. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbedWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	TabbedWindowController* twc = [[TabbedWindowController alloc] initWithWindowNibName:@"TabbedWindowController"];
	[twc.window makeKeyAndOrderFront:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


@end
