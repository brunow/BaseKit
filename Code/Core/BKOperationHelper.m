//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
