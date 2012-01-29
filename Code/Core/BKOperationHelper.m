//
//  NSObject+BWKit.m
//  BWKit
//
//  Created by Bruno Wernimont on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BKOperationHelper.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKOperationHelper


////////////////////////////////////////////////////////////////////////////////
+ (void)performBlockInBackground:(BKBasicBlock)block completion:(BKBasicBlock)completionBlock waitUntilDone:(BOOL)waitUntilDone {
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    BKBasicBlock operation = [[block copy] autorelease];
    BKBasicBlock completion = [[completionBlock copy] autorelease];
    
    if (completion == nil)
        completion = ^{};
    
    if (waitUntilDone) {
        dispatch_sync(concurrentQueue, operation);
        dispatch_sync(mainQueue, ^{
            completion();
        });
    } else {
        dispatch_async(concurrentQueue, ^{
            operation();
            dispatch_async(mainQueue, ^{
                completion();
            });
        });
    }
}


////////////////////////////////////////////////////////////////////////////////
+ (void)performBlockInBackground:(BKBasicBlock)block completion:(BKBasicBlock)completionBlock {
    [self performBlockInBackground:block completion:completionBlock waitUntilDone:NO];
}


////////////////////////////////////////////////////////////////////////////////
+ (void)performBlockInBackground:(BKBasicBlock)block {
    [self performBlockInBackground:block completion:nil];
}

@end
