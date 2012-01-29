//
//  NSDictionary+BaseKit.h
//  BaseKit
//
//  Created by Bruno Wernimont on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BaseKit)

/**
 * Convinient method to check if the dictionary is empty or not.
 */
@property (nonatomic, readonly) BOOL isEmpty;

/**
 * Check if a value is assiated with the key
 */
- (BOOL)containsObjectForKey:(id)key;

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

//+ (id)gh_dictionaryWithKeysAndObjectsMaybeNil:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION; [NSNull null]

@end
