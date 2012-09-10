//
//  MessageBox.m
//
// Created by Olivier Louvignes on 2012-09-01.
//
// Copyright 2011 Olivier Louvignes. All rights reserved.
// MIT Licensed

#import "MyPlugin.h"

@implementation MyPlugin

@synthesize callbackId = _callbackId;

- (void)myMethod:(CDVInvokedUrlCommand*)command {

	self.callbackId = command.callbackId;
	NSDictionary *options = [command.arguments objectAtIndex:0];

	// Build returned result
	BOOL success = YES;
	NSDictionary *result = [NSDictionary dictionaryWithObjectsAndKeys:
							@"foo", @"fooValue",
							@"bar", @"barValue", nil];

	// Create Plugin Result
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];

	// Checking if cancel was clicked
	if (success) {
		[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];
	} else {
		[self writeJavascript: [pluginResult toErrorCallbackString:self.callbackId]];
	}

}

@end
