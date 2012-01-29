//
//  NSMutableArray+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSMutableArrayBaseKitTest : GHTestCase
@end

@implementation NSMutableArrayBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddObjectToArray {
    NSString *object = @"object";
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:object defaultValue:@"default string"];
    
    GHAssertTrue([array objectAtIndex:0] == object, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddDefaultObjectToArray {
    NSString *defaultObject = @"default object";
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:nil defaultValue:defaultObject];
    
    GHAssertTrue([array objectAtIndex:0] == defaultObject, nil);
}

@end
