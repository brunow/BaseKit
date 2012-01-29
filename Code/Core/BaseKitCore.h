//
//  BaseKit.h
//  BaseKit
//
//  Created by Bruno Wernimont on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKBlocks.h"

// Helpers /////////////////////////////////////////////////////////////////////////////////////////
#import "BKIteratingHelper.h"
#import "BKOperationHelper.h"
#import "BKToogleValue.h"
#import "BKDeviceAvailability.h"

/**
 * Return the app delegate shared instance.
 * Expected that the app delegate is named AppDelegate
 */
#define AppDelegateSharedInstance ((AppDelegate *)[[UIApplication sharedApplication] delegate])