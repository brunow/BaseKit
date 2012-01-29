//
//  NSObject+BWKit.h
//  BWKit
//
//  Created by Bruno Wernimont on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKBlocks.h"

@interface BKOperationHelper : NSObject

/**
 * Execute block in another thread
 *
 * Execute your long operation, after operation is finish the finish block is called in the main thread
 *
 * [BKOperationHelper performBlockInBackground:^{
 *      // Load for example table view items
 * } completion:^{
 *      // Reload date in the main thread
 *      [self.tableView reloadData];
 * }] sync:YES;
 
 */
+ (void)performBlockInBackground:(BKBasicBlock)block completion:(BKBasicBlock)completionBlock waitUntilDone:(BOOL)waitUntilDone;

+ (void)performBlockInBackground:(BKBasicBlock)block completion:(BKBasicBlock)completionBlock;

+ (void)performBlockInBackground:(BKBasicBlock)block;

@end
