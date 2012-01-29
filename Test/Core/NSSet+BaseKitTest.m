//
//  NSSet+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSSetBaseKitTest : GHTestCase
@end

@implementation NSSetBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testshouldReturnIsEmpty {
    NSSet *set = [[[NSSet alloc] init] autorelease];
    
    GHAssertTrue([set isEmpty], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testshouldReturnIsNotEmpty {
    NSSet *set = [NSSet setWithObject:@"string"];
    
    GHAssertTrue(![set isEmpty], nil);
}

@end
