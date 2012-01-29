//
//  NSMutableDictionary+BaseKit.h
//  BaseKit
//
//  Created by Bruno Wernimont on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BaseKit)

- (void)setObject:(id)anObject forKey:(id)aKey defaultValue:(id)defaultValue;

@end
