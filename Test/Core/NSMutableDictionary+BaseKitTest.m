//
//  NSMutableDictionary+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSMutableDictionaryBaseKitTest : GHTestCase
@end

@implementation NSMutableDictionaryBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddObjectToDictionary {
    NSString *object = @"object";
    NSString *key = @"key";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:object forKey:key defaultValue:nil];
    
    GHAssertTrue([dict objectForKey:key] == object, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddDefaultObjectToDictionnary {
    NSString *defaultObject = @"default object";
    NSString *key = @"key";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:nil forKey:key defaultValue:defaultObject];

    GHAssertTrue([dict objectForKey:key] == defaultObject, nil);
}

@end
