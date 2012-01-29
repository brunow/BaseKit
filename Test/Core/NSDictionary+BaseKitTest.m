//
//  NSDictionary+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSDictionaryBaseKitTest : GHTestCase
@end

@implementation NSDictionaryBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnIsEmpty {
    NSDictionary *dictionary = [NSDictionary dictionary];
    
    GHAssertTrue([dictionary isEmpty], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnIsNotEmpty {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@"object" forKey:@"key"];
    
    GHAssertTrue(![dictionary isEmpty], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldContainsObjectForKey {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"object1", @"key1", @"object2", @"key2", nil];
    
    GHAssertTrue([dict containsObjectForKey:@"key1"], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldNotContainsObjectForKey {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"object1", @"key1", @"object2", @"key2", nil];
    
    GHAssertTrue(![dict containsObjectForKey:@"key3"], nil);
}


/*
 

- (id)objectForKey:(id)aKey defaultObject:(id)defaultObject;

- (BOOL)boolValueForKey:(id)aKey defaultValue:(BOOL)defaultValue;

- (BOOL)boolValueForKey:(id)aKey;

- (int)intValueForKey:(id)aKey;

- (float)floatValueForKey:(id)aKey defaultValue:(float)defaultValue;

- (float)floatValueForKey:(id)aKey;

- (NSInteger)integerValueForKey:(id)aKey defaultValue:(NSInteger)defaultValue;

- (NSInteger)integerValueForKey:(id)aKey;

- (double)doubleValueForKey:(id)aKey defaultValue:(NSInteger)defaultValue;

- (double)doubleValueForKey:(id)aKey;

- (NSString *)stringValueForKey:(id)aKey defaultValue:(NSString *)defaultValue;

- (NSString *)stringValueForKey:(id)aKey;

- (NSNumber *)numberValueForKey:(id)aKey defaultValue:(NSNumber *)defaultValue;

- (NSNumber *)numberValueForKey:(id)aKey;
*/

@end
