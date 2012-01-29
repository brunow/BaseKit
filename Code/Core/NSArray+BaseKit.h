//
//  BWKit+NSArray.h
//  BWKit
//
//  Created by Bruno Wernimont on 5/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSArray (BaseKit)

/**
 * Convinient method to check if the array is empty or not.
 */
@property (nonatomic, readonly) BOOL isEmpty;

/**
 * Simply return the first object or nil if array is empty.
 */
- (id)firstObject;

- (BOOL)boolValueAtIndex:(NSInteger)index;

- (int)intValueAtIndex:(NSInteger)index;

- (NSInteger)integerValueAtIndex:(NSInteger)index;

- (float)floatValueAtIndex:(NSInteger)index;

- (double)doubleValueAtIndex:(NSInteger)index;

- (NSString *)stringValueAtIndex:(NSInteger)index;

- (NSNumber *)numberValueAtIndex:(NSInteger)index;

@end
