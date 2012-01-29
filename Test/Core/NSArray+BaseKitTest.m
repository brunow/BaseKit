//
//  NSArray+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSArrayBaseKitTest : GHTestCase
@end

@implementation NSArrayBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testshouldReturnIsEmpty {
    NSArray *array = [NSArray array];
    
    GHAssertTrue([array isEmpty], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testshouldReturnIsNotEmpty {
    NSArray *array = [NSArray arrayWithObject:@"string"];
    
    GHAssertTrue(![array isEmpty], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldBeFirstObject {
    NSArray *items = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", nil];
    
    GHAssertTrue([items objectAtIndex:0] == [items firstObject], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnBoolValue {
    BOOL value = YES;
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithBool:value]];
    
    GHAssertTrue([array boolValueAtIndex:0] == value, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnIntValue {
    int value = 4;    
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInt:value]];
    
    GHAssertTrue([array intValueAtIndex:0] == value, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnIntegerValue {
    NSInteger value = 4;    
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInteger:value]];
    
    GHAssertTrue([array integerValueAtIndex:0] == value, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnFloatValue {
    float value = 4.4;    
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithFloat:value]];
    
    GHAssertTrue([array floatValueAtIndex:0] == value, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnDoubleValue {
    double value = 4.4;    
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithDouble:value]];
    
    GHAssertTrue([array doubleValueAtIndex:0] == value, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnNSStringValue {
    NSString *value = @"string";
    NSArray *array = [NSArray arrayWithObject:value];
    
    GHAssertTrue([[array stringValueAtIndex:0] isEqualToString:value], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnNSNumberValue {
    NSNumber *value = [NSNumber numberWithFloat:4.5];
    NSArray *array = [NSArray arrayWithObject:value];
    
    GHAssertTrue([[array numberValueAtIndex:0] floatValue] == [value floatValue], nil);
}

@end
