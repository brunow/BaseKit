//
//  BKOperationHelperTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface BKOperationHelperTest : GHTestCase
@end

@implementation BKOperationHelperTest


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldRunOnMainThread {
    return YES;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldNotRunOperationOnMainThread {
    __block BOOL isNotMainThread = YES;
    
    [BKOperationHelper performBlockInBackground:^{
        isNotMainThread = ![NSThread isMainThread];
    }];
    
    GHAssertTrue(isNotMainThread, @"");
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldRunCompletionOperationOnMainThread {
    __block BOOL isMainThread = YES;
    
    [BKOperationHelper performBlockInBackground:^{
        
    } completion:^{
        isMainThread = [NSThread isMainThread];
    }];
    
    GHAssertTrue(isMainThread, @"");
}

@end
