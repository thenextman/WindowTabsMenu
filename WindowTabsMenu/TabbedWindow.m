//
//  TabbedWindow.m
//  WindowTabsMenu
//
//  Created by Richard Markiewicz on 2017-07-05.
//  Copyright © 2017 Richard Markiewicz. All rights reserved.
//

#import "TabbedWindow.h"

#import "TabbedWindowController.h"

@implementation TabbedWindow

BOOL didAddMenuItem;

- (void)awakeFromNib
{
	[self toggleTabBar:self];
	
	self.title = [[NSUUID UUID] UUIDString];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuDidStartTracking:) name:@"NSMenuDidBeginTrackingNotification" object:nil];
}

- (IBAction)newWindowForTab:(id)sender
{
	TabbedWindowController* twc = [[TabbedWindowController alloc] initWithWindowNibName:@"TabbedWindowController"];
	[self addTabbedWindow:twc.window ordered:NSWindowAbove];
	[twc.window makeKeyAndOrderFront:nil];
}

- (void)menuDidStartTracking:(NSNotification*)sender
{
	if(didAddMenuItem)
		return;
	
	NSMenu *tabMenu = (NSMenu *)sender.object;
	
	NSMenuItem *myMenuItem = [[NSMenuItem alloc] initWithTitle:@"My cool item" action:@selector(myCoolAction:) keyEquivalent:@""];
	
	NSMenuItem *anotherItem = [tabMenu itemAtIndex:0];
        myMenuItem.target = anotherItem.target;
	
	[tabMenu addItem:myMenuItem];
	
	didAddMenuItem = YES;
}

- (void)myCoolAction:(id)sender
{
	NSLog(@"You clicked on the tab for: %@", self.title);
}


@end
