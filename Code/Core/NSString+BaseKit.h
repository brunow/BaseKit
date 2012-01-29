//
//  NSString+BWKit.h
//  BWKit
//
//  Created by Bruno Wernimont on 6/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BaseKit)

- (NSString *)stringByCapitalizingFirstLetter;

/**
 * Return the camelized string
 * Expected that the string is of type: first_letter
 * first_letter -> firstLetter
 */
- (NSString *)stringByCamelizingString;

/**
 * 
 */
- (BOOL)containsString:(NSString *)string;

@end
